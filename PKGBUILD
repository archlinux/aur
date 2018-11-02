# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Maintainer: Infernio <infernio at icloud dot com>

pkgname=lombok-eclipse
pkgver=1.18.4
pkgrel=1
pkgdesc="Project Lombok integrated to Eclipse installation"
arch=("any")
url="http://projectlombok.org"
license=('MIT')
makedepends=('java-runtime')
depends=('eclipse-java' 'java-runtime')
install=lombok.install
source=("https://projectlombok.org/downloads/lombok-${pkgver}.jar")
sha256sums=('39f3922deb679b1852af519eb227157ef2dd0a21eec3542c8ce1b45f2df39742')
noextract=("lombok.jar")

build() {
    java -jar lombok-$pkgver.jar publicApi
}

package() {
    install -Dm644 lombok-$pkgver.jar "${pkgdir}"/usr/lib/eclipse/lombok.jar
    install -Dm644 lombok-api.jar "${pkgdir}"/usr/lib/eclipse/lombok-api.jar
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
