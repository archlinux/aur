# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
pkgname=bitrise-bin
pkgver=2.36.0
pkgrel=1
pkgdesc="The workflow runner that powers Bitrise builds.Run your automations on your Mac or Linux machine(prebuilt version)"
arch=('x86_64')
url="https://www.bitrise.io/cli"
_ghurl="https://github.com/bitrise-io/bitrise"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-x86_64"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/bitrise-io/bitrise/v${pkgver}/LICENSE"
)
sha256sums=('e2edd415008a5d85ed9575adb54e42c9e6ad9622ffee5bcde07d203388857be1'
            'a0379118157469b6a466bf070c8986ffbca0874d10bb4950e0c6018544914414')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
