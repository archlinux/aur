# Contributor: scrawler <scrawler@gmail.com>
pkgname=newlisp
pkgver=10.7.1
pkgrel=1
pkgdesc="newLISP is a LISP like, general purpose scripting language."
url="http://www.newlisp.org"
license=('GPL')
arch=('x86_64' 'i686')
depends=('readline')
optdepends=('jdk8-openjdk')
options=('docs')
source=(http://newlisp.org/downloads/$pkgname-$pkgver.tgz)
md5sums=('e4c8da46f7b435a5b2de441f6929527c')
install=$pkgname.install

build() {
cd $srcdir/$pkgname-$pkgver
./configure
}
package(){
cd $srcdir/$pkgname-$pkgver
[ $CARCH = "x86_64" ] && make -f makefile_linuxLP64_utf8
[ $CARCH = "i686" ] && make -f makefile_linux_utf8
install -d $pkgdir/usr/bin
install -d $pkgdir/usr/share/man/man1
make bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man \
datadir=$pkgdir/usr/share install
}
