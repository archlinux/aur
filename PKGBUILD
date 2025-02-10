# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zoraxy-bin
pkgver=3.1.7
pkgrel=1
pkgdesc='A general purpose HTTP reverse proxy and forwarding tool. Now written in Go!(Precompiled version)'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://zoraxy.aroz.org/"
_ghurl="https://github.com/tobychui/zoraxy"
license=('AGPL-3.0-only')
depends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}.service")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64")
sha256sums=('859e45caece0ed8b9e3bfd90bc21a18e028cc9090c050cf59fefdae937804bfb')
sha256sums_aarch64=('79cf7fe15278a45857fd87a6e0e65731c939ffeeedc353f1a0a29584c7c9c72d')
sha256sums_armv7h=('e6b18c469dfdce927c1ad4a492aa6bb6d70eb20d89d7a906a69c2a8599cd9b8b')
sha256sums_i686=('aa039d93ac18900864240f89dca04bfc5e68c05447947b6c0ffb1cefa450fd4a')
sha256sums_x86_64=('70a00d02a3483d15f4d286355755b7232596399b9ec6f2aa6ea39d0c526eef4b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}