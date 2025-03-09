# Maintainer: Starry Wang <starry.wang@suse.com>
pkgname=hangar-bin
pkgver=1.9.1
pkgrel=1
epoch=
pkgdesc="Command line utility for container images"
arch=("x86_64" "aarch64")
url="https://github.com/cnrancher/hangar"
license=("Apache-2.0")
conflicts=("hangar" "hangar-git")
depends=()
makedepends=(
    "gzip"
    "tar"
)
provides=()
source_x86_64=(
    "https://github.com/cnrancher/hangar/releases/download/v${pkgver}/hangar_Linux_x86_64.tar.gz"
)
sha256sums_x86_64=(
    "a9981b5a6d01d7b8bed6143c7e4899efc4ad74d80a623a4ad216e997bdbdc29f"
)
source_aarch64=(
    "https://github.com/cnrancher/hangar/releases/download/v${pkgver}/hangar_Linux_arm64.tar.gz"
)
sha256sums_aarch64=(
    "1e80772c543730cd84f20be1c0481618257a1adc7a1070e36f7c199687e52574"
)

package() {
    cd ${srcdir}/hangar_Linux*/
    install -Dm755 hangar ${pkgdir}/usr/local/bin/hangar
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
