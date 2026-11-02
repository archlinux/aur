# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
pkgname=bitrise-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="The workflow runner that powers Bitrise builds.Run your automations on your Mac or Linux machine."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.bitrise.io/cli"
_ghurl="https://github.com/bitrise-io/bitrise"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=(
    '!strip'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/bitrise-io/bitrise/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-x86_64")
sha256sums=('a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
sha256sums_aarch64=('7972cae3ba82f10313d5f0749e6d25cacc8ebf3e6ecf0d13da2ff0a630543fd0')
sha256sums_x86_64=('0f798718aa0fd5b64599bf408df12c1676965223a39bc0903f84ce7f1fc78921')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
