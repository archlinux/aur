# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: detiam <dehe_tian@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-rs-bin
pkgver=0.10.7
pkgrel=1
pkgdesc="A custom protocol, rule based network proxy software"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/Watfaq/clash-rs"
license=(Apache-2.0)
depends=(libgcc)
provides=(clash-rs)
conflicts=(clash-rs)
backup=(etc/clash-rs/config.yaml)
install="${pkgname}.install"
source=(clash-rs.service
        clash-rs@.service
        config.yaml)
source_x86_64=("${pkgname}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/clash-rs-x86_64-unknown-linux-gnu")
source_armv7h=("${pkgname}-armv7h-${pkgver}::${url}/releases/download/v${pkgver}/clash-rs-armv7-unknown-linux-gnueabihf")
source_aarch64=("${pkgname}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/clash-rs-aarch64-unknown-linux-gnu")
source_i686=("${pkgname}-i686-${pkgver}::${url}/releases/download/v${pkgver}/clash-rs-i686-unknown-linux-gnu")

sha256sums=('64c1b08fe40af101b5a113212e28aec7e91f63424bec85d50efc5b0fc9ce62ce'
            'c1629d3f5b48053616141076ad8d21031fbca84a352b123d9e3c5bad6406f4a7'
            'd6f1782c0a57591ef6b8c4c898fc7a883363ec45742ae41eee8b91eb68d90f05')
sha256sums_x86_64=('d9dde19f76d8d034686294df0d3a155d49980904125f0ff292aa554acbbb250a')
sha256sums_armv7h=('1cee6d52daa52147bf2273aa2011dfb1d36af5a68b477cebe0d6dba7707869c0')
sha256sums_aarch64=('d90e50dcacb6bdd48f772c359ad51734cb6d1ba68b1870e2932294a20095bb74')
sha256sums_i686=('f2bf4dd87c9a0baaceb140e4d0db86e407a9a5066924053f254e099b96587a42')

package() {
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash-rs"
    install -Dm644 config.yaml -t "${pkgdir}/etc/clash-rs/config.yaml"
    install -Dm644 clash-rs{,@}.service -t "${pkgdir}/usr/lib/systemd/system/"
}
