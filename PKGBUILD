# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )

pkgname=labplot-kf5
pkgver=2.1.0
pkgrel=1
pkgdesc="A free software data analysis and visualization application"
arch=('i686' 'x86_64')
url='http://labplot.sourceforge.net/'
license=('GPL')
depends=('gsl')
makedepends=('cmake' 'extra-cmake-modules')
source=("http://ftp.pbone.net/pub/kde/stable/labplot/2.1.0/src/labplot-kf5-2.1.0.tar.xz")
md5sums=('7ca4deb2a009f0da4349fda695a43788')


build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
