# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor/Submitter: Justin Vreeland <vreeland.justin@gmail.com
# based off of altos PKGBUILD by Bob Finch

pkgname=jfreechart
_pkgname=JFreeChart
pkgver=1.5.5
pkgrel=1
pkgdesc="Charting program for java"
arch=('any')
url="https://www.jfree.org/jfreechart/"
license=('LGPL-2.1-only')
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
md5sums=('d4565bc690771da8ea56abe50ed2ab51')
sha256sums=('b8e9fd007abd91d9e73c9fa3a59d4af3b4d551f864dafc711a1ac99f58bedccb')
