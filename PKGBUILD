# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: detiam <dehe_tian@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-rs-bin
pkgver=0.10.8
pkgrel=1
pkgdesc="A custom protocol, rule based network proxy software"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/Watfaq/clash-rs"
license=(Apache-2.0)
depends=(glibc libgcc libgcc_s.so)
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
sha256sums_x86_64=('d8a3be45594d7a50ec899119751d3d27a65ca30177eddf3e172ccc23e6e096da')
sha256sums_armv7h=('08eb095bb7f2b69f5289675e58c05293e5e712543014e3796864e336ca62a92c')
sha256sums_aarch64=('a683c74b04f99f4ab024c2b07d89588e8554dfcc6f75b21499def610b586511e')
sha256sums_i686=('cdb8d2d2ea026fb2124c85f16513fd0058ad79a4094da4bc3322b987d7ec762a')

package() {
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash-rs"
    install -Dm644 config.yaml -t "${pkgdir}/etc/clash-rs/config.yaml"
    install -Dm644 clash-rs{,@}.service -t "${pkgdir}/usr/lib/systemd/system/"
}
