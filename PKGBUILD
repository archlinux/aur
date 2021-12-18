pkgname=assertj-core
pkgver=3.21.0
pkgrel=1
pkgdesc='Fluent assertions for java'
url='https://assertj.github.io/doc/'
arch=(any)
license=(Apache)
depends=('java-runtime=11')
makedepends=(maven 'java-environment=11')
source=("https://github.com/assertj/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('4b387fca1dab4597a507d3d681d71f15c50ddd825029b2c48ec926378ad02027')

build() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	JAVA_HOME=/usr/lib/jvm/java-11-openjdk mvn package -Djacoco.skip=true
}

package() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	install -Dm644 "target/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"
	ln -s "$pkgdir/usr/share/java/$pkgname"{-$pkgver,}.jar
}
