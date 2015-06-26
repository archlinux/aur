# Contributor: Andreas W. Hauser
# Contributor: Benoit Favre

pkgname=crfpp
pkgver=0.58
pkgrel=3
pkgdesc="A Conditional Random Field implementation"
url="http://crfpp.sourceforge.net"
arch=('x86_64' 'i686')
license=('LGPL' 'BSD')
source=("http://crfpp.googlecode.com/files/CRF%2B%2B-${pkgver}.tar.gz")

build() {
  cd ${srcdir}/CRF++-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/CRF++-${pkgver}
  make DESTDIR=${pkgdir} install
}

md5sums=('c8ffd456ab1a6815ba916c1083194a99')
