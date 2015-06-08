# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=pegdown
pkgver=1.4.2
pkgrel=1
pkgdesc="A pure Java library for clean and lightweight Markdown processing"
arch=('any')
url="http://github.com/sirthias/pegdown"
depends=('java-environment' 'parboiled>=1.1.5')
license=('APACHE')
source=( "http://repo1.maven.org/maven2/org/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.jar"
		setClasspath.sh)

package() {
	cd "$srcdir"

	install -D -m644 setClasspath.sh "$pkgdir"/usr/share/java/$pkgname/setClasspath.sh
	install -m644 ${pkgname}-${pkgver}.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname-$pkgver.jar

	cd "$pkgdir"/usr/share/java/$pkgname

    ln -s $pkgname-$pkgver.jar $pkgname.jar
}

sha1sums=('d96db502ed832df867ff5d918f05b51ba3879ea7'
          'be7935118c5b99183738d54cfc1777fd62797368')
