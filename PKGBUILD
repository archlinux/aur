#Maintainer: DetMittens
pkgname=libcmrt
pkgver=1.0.6
pkgrel=1
pkgdesc="Intel C for Media RunTime GPU kernel manager"
arch=('i686' 'x86_64')
depends=('libva')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
source=("cmrt-${pkgver}.tar.gz::https://github.com/01org/cmrt/archive/${pkgver}.tar.gz")
sha256sums=(SKIP)

prepare() {
  cd ${srcdir}/cmrt-${pkgver}
  autoreconf -v --install
}

build() {
  cd ${srcdir}/cmrt-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/cmrt-${pkgver}
  make install DESTDIR=${pkgdir}
  mv ${pkgdir}/usr/etc ${pkgdir}
}
