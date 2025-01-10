# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zoraxy-bin
pkgver=3.1.6
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64")
sha256sums_aarch64=('065961f709db3c213018c7105d8d81310a654ebd4d26dedee675116d92dddbdf')
sha256sums_armv7h=('9f310edad6786925c925a9c1a1e330683f14700ac5d9eec4e693c72b818b513f')
sha256sums_i686=('37752545e2686510ac93e753711358bd435253e5449c63470f70cc073feccc4d')
sha256sums_x86_64=('2213a61cc3344f03e37fb161132a84da6cc60c1ac9b9054e143b544c7342b3bd')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}