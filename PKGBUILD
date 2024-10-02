# Maintainer: Denis Benato <benato.denis96@gmail.com>
# Maintainer: William Edwards <shadowapex@gmail.com>
pkgname=inputplumber
_pkgbase=inputplumber
pkgver=0.36.0
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
sha256sums=('5f3fd727aa63b6051cdfe56407ef153eac867fee3c210957678ee23e3e800ad4')

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
