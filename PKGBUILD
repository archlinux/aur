# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=1.8
pkgrel=1
pkgdesc="A native YouTube client in QT. Watch YouTube videos without Flash Player"
arch=('i686' 'x86_64')
url='http://flavio.tordini.org/minitube'
license=('GPL')
depends=('phonon')
install="${pkgname}.install"
source=("http://flavio.tordini.org/files/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'fix-build.patch')
md5sums=('dabfe4776ab6a19eff14e644f68714bb'
         'b6d67acdfc5ef17235449ca13575ba97')

build() {
  cd "${srcdir}"/${pkgname}

  patch -p1 -i "${srcdir}"/fix-build.patch

  qmake
}

package() {
  cd "${srcdir}"/${pkgname}
  make install INSTALL_ROOT="${pkgdir}"
}
