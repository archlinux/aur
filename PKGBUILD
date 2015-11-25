# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-os
pkgver=0.9.6
pkgrel=1
pkgdesc="Basic Ruby OS functions"
arch=('any')
url="http://rubygems.org/gems/os/"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/os-$pkgver.gem)
sha256sums=('bf7a387eed04790758ef4cf53da2dad6ad65f394aca8927b7b8f4bf106479bd2')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    os-$pkgver.gem
  install -Dm644 "$pkgdir$_gemdir/gems/os-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
