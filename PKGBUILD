# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-rs-bin
pkgver=0.1.14
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
sha256sums_x86_64=('3576e4a16cce9d01c7e86e4d1c1db0facb3110e406434f44ecdda3e7f117b48d')
sha256sums_armv7h=('f3cb3197a7691ea7b8cf9611e81feedc0d163fde9cc76a0a778233f0bd1a6176')
sha256sums_aarch64=('37c759e9946349793bf749d192173c390ab163b4302164515647df35338147d5')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash-rs"
    install -Dm644 "config.yaml" "${pkgdir}/etc/clash-rs/config.yaml"
    install -Dm644 "clash-rs.service" "${pkgdir}/usr/lib/systemd/system/clash-rs.service"
    install -Dm644 "clash-rs@.service" "${pkgdir}/usr/lib/systemd/system/clash-rs@.service"
}
