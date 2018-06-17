# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=lombok-eclipse
pkgver=1.18.0
pkgrel=2
pkgdesc="Project Lombok integrated to Eclipse installation"
arch=("any")
url="http://projectlombok.org"
license=('MIT')
makedepends=('java-runtime')
depends=('eclipse-java' 'java-runtime')
install=lombok.install
source=("https://projectlombok.org/downloads/lombok-${pkgver}.jar")
sha256sums=('88ed9af526d13a84361cbe1216f815ee78c82c342618ea1a48b6de1acbb9d2b4')
noextract=("lombok.jar")

build() {
    java -jar lombok-$pkgver.jar publicApi
}

package() {
    install -Dm644 lombok-$pkgver.jar "${pkgdir}"/usr/lib/eclipse/lombok.jar
    install -Dm644 lombok-api.jar "${pkgdir}"/usr/lib/eclipse/lombok-api.jar
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
