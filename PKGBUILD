# Maintainer: Denis Benato <benato.denis96@gmail.com>
# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber
_pkgbase=inputplumber
pkgver=0.36.4
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
options=(!lto)
url="https://github.com/ShadowBlip/InputPlumber"
license=('GPL')
depends=('dbus' 'libevdev' 'libiio')
makedepends=('rust' 'make' 'cmake' 'clang')
provides=('inputplumber')
conflicts=('inputplumber-bin' 'inputplumber-git')
source=("InputPlumber-$pkgver.tar.gz::https://github.com/ShadowBlip/InputPlumber/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b070508e42915a4c11f15cf0323a9b3ce66091496d79b140e21e32e8c5ec8ad0')

prepare() {
  cd "$srcdir/InputPlumber-$pkgver"
}

build() {
  cd "$srcdir/InputPlumber-$pkgver"
  make build
}

package() {
  cd "$srcdir/InputPlumber-$pkgver"
  make install PREFIX=${pkgdir}/usr NO_RELOAD=true
}
