# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=elk
pkgver=3.99.8
pkgrel=1
pkgdesc="Scheme interpreter and extension language."
arch=('i686' 'x86_64')
url="http://sam.zoy.org/elk/"
license=('custom')
depends=('gcc' 'openmotif' 'libelf' 'gdbm' 'libxaw')
source=(http://sam.zoy.org/elk/elk-$pkgver.tar.bz2 COPYING)
md5sums=('1e68d7370907d575efa706fd9ceb28fd'
         '71807aa857f424ba48804e066c3623d3')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -D ../COPYING $pkgdir/usr/share/licenses/elk/COPYING
}
