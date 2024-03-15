# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-aws
pkgname=ruby-$_gemname
pkgver=3.21.1
pkgrel=1
pkgdesc='Module for the '\''fog'\'' gem to support Amazon Web Services.'
arch=(any)
url='https://github.com/fog/fog-aws'
license=(MIT)
depends=(ruby-fog-core ruby-fog-json ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('b7bd4724b45e48eb11f05430bf02b0bc7d43578abcb62d5560865c49af17961e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
