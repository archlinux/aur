# Maintainer : David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.2
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('mpv' 'qt5-declarative' 'qt5-x11extras')
makedepends=('qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('7607b976616bd5c9cddbb31178be3eea9558a5999fb5bb33eedb73312220efbf40a5f90833e334930461272a274c550ade40793ed6fa22c3e1a10badc2c179e7')

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}/"
  install -vDm 644 {AUTHORS,CHANGES,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
