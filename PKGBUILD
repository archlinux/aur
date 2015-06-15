# Submitter: Guenther Starnberger <gst@sysfrog.org>
# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=gpshell
pkgver=1.4.4
pkgrel=2
pkgdesc="gpshell GlobalPlatform command shell"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/globalplatform/"
depends=('glibc' 'globalplatform')
source=(http://downloads.sourceforge.net/globalplatform/gpshell-${pkgver}.tar.gz)
md5sums=('f3e43b0809fe063b36a2d85c6d271c9d')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
