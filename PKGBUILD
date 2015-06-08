# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=parboiled
pkgver=1.1.6
pkgrel=2
pkgdesc="A pure Java library providing for lightweight and easy-to-use, yet powerful and elegant parsing of arbitrary input text based on Parsing expression grammars (PEGs)"
arch=('any')
url="http://parboiled.org/"
depends=('java-environment' 'java-asm' "bash" )
license=('APACHE')
source=(http://repo1.maven.org/maven2/org/$pkgname/$pkgname-core/$pkgver/$pkgname-core-$pkgver.jar
		http://repo1.maven.org/maven2/org/$pkgname/$pkgname-java/$pkgver/$pkgname-java-$pkgver.jar
		setClasspath.sh)

package() {
    cd "$srcdir"

    install -D -m644 setClasspath.sh $pkgdir/usr/share/java/$pkgname/setClasspath.sh
    install -m644 $pkgname-core-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname-core-$pkgver.jar
    install -m644 $pkgname-java-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname-java-$pkgver.jar

    cd $pkgdir/usr/share/java/$pkgname

    ln -s $pkgname-core-$pkgver.jar $pkgname-core.jar
    ln -s $pkgname-java-$pkgver.jar $pkgname-java.jar

}

sha1sums=('11bd0c34fc6ac3c3cbf440ab8180cc6422c044e9'
          'cb2ffa720f75b2fce8cfd1875599319e75ea9557'
          '6ad50f7f1e4f24981f3a1b6397eca8f2bf329046')
