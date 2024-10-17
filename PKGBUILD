# Maintainer: Denis Benato <benato.denis96@gmail.com>
# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber
_pkgbase=inputplumber
pkgver=0.36.5
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
sha256sums=('7ac6950d57febc2d786e869b9efdc2954a0e15c1b1363bfaf7a5c424c9bdc169')

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
