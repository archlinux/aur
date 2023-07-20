# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor/Submitter: Justin Vreeland <vreeland.justin@gmail.com
# based off of altos PKGBUILD by Bob Finch

pkgname=jfreechart
_pkgname=JFreeChart
pkgver=1.5.4
pkgrel=1
pkgdesc="Charting program for java"
arch=('any')
url="https://www.jfree.org/jfreechart/"
license=('LGPL')
depends=('java-runtime' )
makedepends=('maven' 'java-runtime-common')
source=("https://github.com/jfree/jfreechart/archive/refs/tags/v$pkgver.tar.gz")

build() {
	cd $srcdir/$pkgname-$pkgver
	mvn clean install
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -d $pkgdir/usr/share/java/
	install -m644 target/*.jar $pkgdir/usr/share/java/
}
md5sums=('f797d94595bafbd358b278d16b960ec5')
sha256sums=('02370e037950fee2e15f61d163b9b5c641e2438a4b110ff112f948ceff57d36a')
