pkgname=amusing
pkgver=1.0.0
pkgrel=1
pkgdesc="A Musing client"
arch=("x86_64")
url="https://github.com/alfazet/musing"
license=("MIT")
makedepends=("rust")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alfazet/amusing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("85119a1f9b594756e98c6ebfa4598f85205c9285be1dae1967e4380e99345e15")

build() {
    cd "${pkgname}-${pkgver}"
    cargo build -r --locked --target-dir=target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dvm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
