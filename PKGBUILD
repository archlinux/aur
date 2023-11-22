# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-brightbox
pkgname=ruby-$_gemname
pkgver=1.11.0
pkgrel=2
pkgdesc='Module for the fog gem to support Brightbox Cloud'
arch=(any)
url='https://rubygems.org/gems/fog-brightbox'
license=(MIT)
depends=(ruby-dry-inflector ruby-fog-core ruby-fog-json)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('a7f8772cf47f0d571d7ec2a4fc07d5bd51a046ec86d069815807bc1ef3daf5f9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
