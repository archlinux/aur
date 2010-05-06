# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=libgadu
pkgver=1.9.0rc3
_pkgver=1.9.0-rc3
pkgrel=1
pkgdesc="Gadu-Gadu protocol libraries"
arch=('i686' 'x86_64')
url="http://toxygen.net/libgadu/"
license=('GPL')
depends=('openssl')
source=("http://toxygen.net/${pkgname}/files/${pkgname}-${_pkgver}.tar.gz")
md5sums=('b13337fd1beaf98056bc7bfa27ff5d31')
options=('!libtool')

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  ./configure --prefix=/usr \
 	 --disable-static \
	 --enable-shared \
	 --with-pthread
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
