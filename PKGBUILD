# Contributor: Filip <fila@pruda.com>
pkgname=pfqueue
pkgver=0.5.6
pkgrel=1
license=('GPL')
pkgdesc="A console-based program to handle MTA (postfix,exim) queues interactively"
arch=(i686 x86_64)
depends=('ncurses')
url="http://pfqueue.sourceforge.net/"
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ff3fbcc39b39112f123b93df579998b8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
