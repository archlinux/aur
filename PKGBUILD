# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=gnoga
pkgver=2.2a
pkgrel=1
pkgdesc="Ada native GUI framework similar to the Electron framework"
arch=('x86_64')
url="http://www.gnoga.com/"
license=('GPL3')
depends=('libgpr')
makedepends=(gcc-ada gprbuild gprtools libgpr)
provides=('gnoga')
source=(https://downloads.sourceforge.net/project/gnoga/gnoga-${pkgver}.zip)
sha256sums=('0f8d6b592885827a12436e3b495534e4b28badb0255a3d279d42ce80063b945f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make -j1 BUILD_MODE=Release all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}"/usr -j1 BUILD_MODE=Release install
  cp "${srcdir}/${pkgname}-${pkgver}"/settings.gpr "${pkgdir}"/usr/share/gpr/settings.gpr
}
