# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=direvent
pkgver=5.0
pkgrel=1
pkgdesc="Deamon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="http://www.gnu.org.ua/software/direvent/"
license=("GPL")
depends=('glibc')
install=$pkgname.install
source=("http://ftp.gnu.org/gnu/direvent/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1fbd26ce98a4e752e82c3b5a0ae85d3360f1fb273c5ef373dc1c55e3c30824c4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
