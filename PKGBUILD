# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=direvent
pkgver=5.1
pkgrel=1
pkgdesc="Deamon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="http://www.gnu.org.ua/software/direvent/"
license=("GPL")
depends=('glibc')
install=$pkgname.install
source=("http://ftp.gnu.org/gnu/direvent/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c461600d24183563a4ea47c2fd806037a43354ea68014646b424ac797a959bdb')

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
