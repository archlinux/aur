pkgname=assertj-core
pkgver=3.8.0
pkgrel=1
pkgdesc='Fluent assertions for java'
url='http://joel-costigliola.github.io/assertj'
arch=(any)
license=(Apache)
makedepends=(maven)
source=("https://github.com/joel-costigliola/$pkgname/archive/$pkgname-$pkgver.tar.gz")
md5sums=('54199fa881a9b757cc0cf2c05dc81aa7')

build() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	mvn package -Djacoco.skip=true
}

package() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	install -Dm644 "target/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"
	ln -s "$pkgdir/usr/share/java/$pkgname"{-$pkgver,}.jar
}
