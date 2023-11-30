# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-rs-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="A custom protocol, rule based network proxy software"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/Watfaq/clash-rs"
license=("Apache-2.0")
groups=()
depends=("glibc")
makedepends=()
checkdepends=()
optdepends=()
provides=("clash-rs")
conflicts=("clash-rs")
replaces=()
backup=("etc/clash-rs/config.yaml")
options=()
install=${pkgname}.install
changelog=
source=("clash-rs.service"
        "clash-rs@.service"
        "config.yaml")
source_x86_64=("${pkgname}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/clash-x86_64-unknown-linux-gnu")
source_armv7h=("${pkgname}-armv7h-${pkgver}::${url}/releases/download/v${pkgver}/clash-armv7-unknown-linux-gnueabihf")
source_aarch64=("${pkgname}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/clash-aarch64-unknown-linux-gnu")

sha256sums=('64c1b08fe40af101b5a113212e28aec7e91f63424bec85d50efc5b0fc9ce62ce'
            'c1629d3f5b48053616141076ad8d21031fbca84a352b123d9e3c5bad6406f4a7'
            'd6f1782c0a57591ef6b8c4c898fc7a883363ec45742ae41eee8b91eb68d90f05')
sha256sums_x86_64=('fa44d5ba0b7cdfafeb543f4b66acbc9aeef84a81640e38f73da243443cfca795')
sha256sums_armv7h=('c285c33d3cf1372d313ea142006b252a038248ddc4120027b1631d6fed2e6ad2')
sha256sums_aarch64=('56343dc6a13f731a72a80674e54988ce1e6a40eba1c35acb6e9900e493597afa')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash-rs"
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-rs/config.yaml"
    install -Dm644 "clash-rs.service" "${pkgdir}/usr/lib/systemd/system/clash-rs.service"
    install -Dm644 "clash-rs@.service" "${pkgdir}/usr/lib/systemd/system/clash-rs@.service"
}
