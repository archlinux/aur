# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-brightbox
pkgname=ruby-$_gemname
pkgver=1.8.0
pkgrel=1
pkgdesc='Module for the fog gem to support Brightbox Cloud'
arch=(any)
url='https://rubygems.org/gems/fog-brightbox'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-dry-inflector)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('1b08885f909eda84d1bd0b642b0582591badf28290542289daa5391e2b33274d84862a5ecbe06a1fe25e246da0242fb27f9e1545e61cffa0884e3f2444e2da3c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
