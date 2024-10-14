pkgname=java-commons-net
pkgver=3.11.1
pkgrel=1
pkgdesc="Apache library that implements the client side of many basic Internet protocols"
arch=('any')
url="https://commons.apache.org/net/"
license=('Apache-2.0')
depends=('java-runtime>=8')
makedepends=('maven')
source=(https://dlcdn.apache.org//commons/net/source/commons-net-${pkgver}-src.tar.gz)
sha512sums=('0999067cc73cb0e0ab4940302180a0afa998b37c51f93c1c744bf1d346d14c89283166a665283d98200e98f0b8c39854f17493890d49ddad5769c4deb49de37e')

build() {
    cd "${srcdir}"/commons-net-${pkgver}-src
    mvn install -DskipTests
}

package() {
    cd "${srcdir}"/commons-net-${pkgver}-src
    install -Dm644 target/commons-net-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}/commons-net-${pkgver}.jar
}
