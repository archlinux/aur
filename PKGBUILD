# Maintainer Justin Vreeland <vreeland.justin@gmail.com
# based off of altos PKGBUILD by Bob Finch

pkgname=jfreechart
_pkgname=JFreeChart
pkgver=1.0.19
pkgrel=1
pkgdesc="Charting program for java"
depends=('java-runtime-common' )
makedepends=('apache-ant' 'git' 'java-runtime-common')
arch=('any')
source=("$pkgname-$pkgver::git+https://github.com/jfree/jfreechart.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/ant"
	ant
}

package() {
	cd "$pkgname-$pkgver"
	install -d $pkgdir/usr/share/java/$pkgname/lib
	install -m644 lib/* $pkgdir/usr/share/java/$pkgname/lib/
}
