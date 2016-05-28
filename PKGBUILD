# Maintainer: mickele <mimocciola[__at__]yahoo[__dot__]com>
pkgname=qcost
pkgver=0.8.2
pkgrel=1
pkgdesc="QCost is a software to write bill of quantities in the construction world."
url="http://ingegnerialibera.altervista.org/wiki/doku.php/qcost:indice"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('qt5-base')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://downloads.sourceforge.net/project/qcost/${pkgver}/QCost_${pkgver}_src.tar.bz2" "qcost.desktop")

build() {
  cd "${srcdir}/QCost_${pkgver}_src"
  qmake
  make
}

package() {
  cd "${srcdir}/QCost_${pkgver}_src"
  make INSTALL_ROOT=${pkgdir} install

  # install menu entry
  install -D -m 644 "icons/qcost.svg" "${pkgdir}/usr/share/pixmaps/qcost.svg"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/qcost.desktop"
}
md5sums=('656b92431532d78efa88d2de71cbf2b8'
         '49d45054eed165ac72e3287d68bcee2b')
