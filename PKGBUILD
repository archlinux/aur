# Contributor: Andreas W. Hauser
# Contributor: Benoit Favre

pkgname=crfpp
pkgver=0.58
pkgrel=5
pkgdesc="A Conditional Random Field implementation"
url="http://crfpp.sourceforge.net"
arch=('x86_64' 'i686')
license=('LGPL' 'BSD')
#source=("http://crfpp.googlecode.com/files/CRF%2B%2B-${pkgver}.tar.gz")
source=("https://docs.google.com/a/google.com/uc?authuser=0&id=0B4y35FiV1wh7QVR6VXJ5dWExSTQ&export=download")

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
