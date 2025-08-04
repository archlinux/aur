pkgname=java-commons-net
pkgver=3.12.0
pkgrel=1
pkgdesc="Apache library that implements the client side of many basic Internet protocols"
arch=('any')
url="https://commons.apache.org/net/"
license=('Apache-2.0')
depends=('java-runtime>=8')
makedepends=('maven')
source=(https://dlcdn.apache.org//commons/net/source/commons-net-${pkgver}-src.tar.gz)
sha512sums=('f33da0d8f279a174e3c4eb4514a091a5ac74bd55067d6f230b268bab425fe92941f7322665c613ab2984c78dcc376cac5d665f966626108dd70604ffe682d149')

build() {
    cd "${srcdir}"/commons-net-${pkgver}-src
    mvn install -DskipTests
}

package() {
    cd "${srcdir}"/commons-net-${pkgver}-src
    install -Dm644 target/commons-net-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}/commons-net-${pkgver}.jar
}
