# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: detiam <dehe_tian@outlook.com>
# Contributor: pallxk <aur@pallxk.com>
# Contributor: adiprasetya <ignilium.inc@gmail.com>
# Contributor: chenx_dust <chenx_dust@outlook.com>

pkgname=clash-rs-bin
pkgver=0.10.10
pkgrel=1
pkgdesc="A custom protocol, rule based network proxy software"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/ibigbug/clash-rs"
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
sha256sums_x86_64=('3d67a0bac436d7db5270c418f6285ad547deeb37c05ab44ebe65d353b4495c32')
sha256sums_armv7h=('6e48f8795c3e32bc7ef68c035680b4fdfab3e7532bf7d53c03eb7fee0f17c6d0')
sha256sums_aarch64=('3c67a0f6256975da3643bf4fe48283c1b04384bc193966d8298efb4f6c9bf608')
sha256sums_i686=('4142c60a2c3dadda851a07d54805bbaceab3cfac947ad7e72fd3a2685a03537f')

package() {
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash-rs"
    install -Dm644 config.yaml -t "${pkgdir}/etc/clash-rs/config.yaml"
    install -Dm644 clash-rs{,@}.service -t "${pkgdir}/usr/lib/systemd/system/"
}
