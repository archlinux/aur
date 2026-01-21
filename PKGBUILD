pkgname=mihomo-smart-bin
pkgver=1.19.19.alpha.6db31f5
pkgrel=1
pkgdesc="Binary version of mihomo-smart."
arch=("x86_64")
url="https://github.com/vernesong/mihomo"
license=("GPL-3.0-or-later")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("mihomo" "clash-meta")
conflicts=("mihomo")
backup=("etc/mihomo/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("mihomo.service::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v1.19.19/.github/release/mihomo.service"
        "config.yaml::https://raw.githubusercontent.com/MetaCubeX/mihomo/refs/tags/v1.19.19/.github/release/config.yaml"
        "mihomo.gz::https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-linux-amd64-v3-alpha-smart-6db31f5.gz"
        "Model.bin::https://github.com/vernesong/mihomo/releases/download/LightGBM-Model/Model-large.bin")

sha256sums=('b4b011a4b5670b09cc7d21a73cbaf47e038ff3f504deb16afab460555572f3a4'
            '65696f4b2ac4ec31987b3783b712a2452418cbe464c23b648fca2a515e478377'
            '1c9d909017e444dd06fdba915bed155a5b3825efc66de1dcb105ee5f30ef563e'
            '8b5c3d8d06150a9fe7ee5d23354faa87aa57cec5f5ac47031cccb5e9c79f1131')

package() {
    cd "${srcdir}"
    install -Dm755 "mihomo.gz" "${pkgdir}/usr/bin/mihomo"
    install -Dm644 "config.yaml" "${pkgdir}/etc/mihomo/config.yaml"
    install -Dm644 "Model.bin" "${pkgdir}/etc/mihomo/Model.bin"
    install -Dm644 "mihomo.service" "${pkgdir}/usr/lib/systemd/system/mihomo.service"
}
