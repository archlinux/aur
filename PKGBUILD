# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=clipsmm
pkgver=0.3.4
pkgrel=1
pkgdesc="A C++ interface to the CLIPS libray, a C library for developing expert systems."
arch=('i686' 'x86_64')
url="http://clipsmm.sourceforge.net/"
license=('GPL')
depends=('clips' 'gtkmm' 'libsigc++')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/project/clipsmm/clipsmm/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d86f2b6e11c319c7ca4cc5b42dd042e1')
sha256sums=('a18a5cb3908cb04e1b0b968531c232df25d17c7787b5771782360256625905e0')
sha384sums=('bfbf06f82ce101432c1a3acc2cffe32d726fd9de623f4fdf10c3912b662542b710733e50d1521857a4111a211e949a81')
sha512sums=('e6b8710775adc9e619addf17995342ad075b0dd42aa2ca3bac58d19a5688d34e747948d78b424f899fd38b8306e3fd9c164b68ff0eab0f5609aed20e171a3aeb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	
  make DESTDIR="${pkgdir}" install
}

