pkgname=musing
pkgver=1.0.1
pkgrel=1
pkgdesc="An MPD-inspired music server"
arch=("x86_64")
url="https://github.com/alfazet/musing"
license=("MIT")
makedepends=("rust")
depends=("alsa-lib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alfazet/musing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("cfd1c9b9bf101141b8da9b2f17c5302a3cd714867b41e0efc37ec2ff16c49b38")

build() {
    cd "${pkgname}-${pkgver}"
    cargo build -r --locked --target-dir=target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dvm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
