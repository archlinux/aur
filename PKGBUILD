# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aws
pkgname=ruby-$_gemname
pkgver=3.17.0
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Amazon Web Services.'
arch=(any)
url='http://github.com/fog/fog-aws'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('ad608ef5a499707eaf6c50ef2fa54773051fa7c0132a2d9d6ca45d459340d749b53c03fbd6938dc877617f5599a7999802aeb7852c867aae8e7e8be0da3561d7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
