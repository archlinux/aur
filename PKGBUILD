pkgname=musing
pkgver=1.1.1
pkgrel=2
pkgdesc="An MPD-inspired music server"
arch=("x86_64")
url="https://github.com/alfazet/musing"
license=("MIT")
makedepends=("rust")
depends=("alsa-lib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alfazet/musing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7d59bb1eb21ccca68ffa895d4db6170c7f311d2e460662a3e57b49459237d085")

build() {
    cd "${pkgname}-${pkgver}"
    cargo build -r --locked --target-dir=target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dvm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
