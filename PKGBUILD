# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Maintainer: Infernio <infernio at icloud dot com>

pkgname=lombok-eclipse
pkgver=1.18.8
pkgrel=1
pkgdesc="Project Lombok integrated to Eclipse installation"
arch=("any")
url="http://projectlombok.org"
license=('MIT')
makedepends=('java-runtime')
depends=('eclipse-java' 'java-runtime')
install=lombok.install
source=("https://projectlombok.org/downloads/lombok-${pkgver}.jar")
sha256sums=('0396952823579b316a0fe85cbd871bbb3508143c2bcbd985dd7800e806cb24fc')
noextract=("lombok.jar")

build() {
    java -jar lombok-$pkgver.jar publicApi
}

package() {
    install -Dm644 lombok-$pkgver.jar "${pkgdir}"/usr/lib/eclipse/lombok.jar
    install -Dm644 lombok-api.jar "${pkgdir}"/usr/lib/eclipse/lombok-api.jar
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
