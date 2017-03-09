# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
# based on altos PKGBUILD by Bob Finch
pkgname=jcommon
_pkgname=JCommon
pkgver=1.0.24
pkgrel=1
pkgdesc="Base routines for JFreeChart"
arch=('any')
licence=('lgpl')
depends=('java-environment')
makedepends=('apache-ant')
url="http://www.jfree.org/jcommon/"
# once more, source forge is a pain to get a good url for
	source=(https://github.com/jfree/jcommon/archive/v1.0.24.tar.gz)
md5sums=('a860903b15afcf9c8d8a9ddbbda45c0e')

build() {
	cd $srcdir/$pkgname-$pkgver/ant
	ant
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -d $pkgdir/usr/share/java/$pkgname/lib
	install -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/lib$pkgname.jar
	install -m644 jcommon-xml-*.jar $pkgdir/usr/share/java
}

