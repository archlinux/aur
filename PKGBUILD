pkgname=amusing
pkgver=1.1.0
pkgrel=2
pkgdesc="A Musing client"
arch=("x86_64")
url="https://github.com/alfazet/musing"
license=("MIT")
makedepends=("rust")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alfazet/amusing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("f6b9b533bd63ff78b82f6bdd647e7a5b1ddb96f142159da1c81569feac7a5733")

build() {
    cd "${pkgname}-${pkgver}"
    cargo build -r --locked --target-dir=target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dvm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
