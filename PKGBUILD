# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=qmpdclient
pkgver=2.0.1
pkgrel=1
pkgdesc="Qt5 client for MPD"
arch=(x86_64)
url="https://github.com/ChaoticEnigma/qmpdclient"
license=(GPL2)
depends=(qt5-base qt5-x11extras qt5-xmlpatterns)
makedepends=(cmake qt5-tools)
source=("qmpdclient-${pkgver}.tar.gz::https://github.com/ChaoticEnigma/qmpdclient/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3b09622dcf2c7b31c25ca9caf6db4a701ba79e7786d8b4d76908239df8655e15')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake --install . --prefix ${pkgdir}/usr
}
