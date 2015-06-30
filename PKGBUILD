# First submit: Gris Ge <cnfourt@gmail.com>
# Maintained by: Wang Chao <wangchao19890207@gmail.com>

pkgname=python2-krbv
origname=python-krbV
pkgver=1.0.90
pkgrel=4
pkgdesc="Python extension module for Kerberos 5"
arch=('x86_64' 'i686')
url=("https://fedorahosted.org/python-krbV/")
license=('GPL2')
depends=('krb5')
source=("https://fedorahosted.org/python-krbV/attachment/wiki/Releases/python-krbV-${pkgver}.tar.bz2?format=raw")
md5sums=('14208ade8e7de39392ed9c429a577a8b')
options=('!libtool')

build() {
  cd $srcdir/python-krbV-$pkgver
  PYTHON="/usr/bin/python2" CFLAGS="-Wextra" LIBNAME="lib" ./configure
  make
}

package() {
  make -C $srcdir/python-krbV-$pkgver DESTDIR="${pkgdir}" install
}
