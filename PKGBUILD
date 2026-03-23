# Based on katawa-shoujo-bin PKGBUILDs written
# by Alice Jenkinson <virtual.aur at zero-x dot nz>,
# with katawa-shoujo by Cravix < dr dot neemous at gmail dot com >
# as reference for non-bundled dependencies
# Maintainer: snit <snit@cock.li>

pkgname=katawa-shoujo-reengineered
pkgver=2.0.4
pkgrel=1
pkgdesc="A fan-made modernization of the classic visual novel"
arch=('any')
url='https://www.fhs.sh/projects'
license=('MPL-2.0' 'CC-BY-NC-ND')
depends=('renpy' 'python-pypresence')

source=(
    "KSRE-${pkgver}-linux.tar.bz2::https://github.com/fleetingheart/ksre/releases/download/v${pkgver}/KSRE-linux.tar.bz2"
    "${pkgname}"
    "${pkgname}.desktop"
    "${pkgname}.png"
)

package() {
    cd "${srcdir}/KSRE-linux"

    # main files
    install -d -m755 "${pkgdir}/usr/share/${pkgname}"
    cp -r game "${pkgdir}/usr/share/${pkgname}"

    # start script
    install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # icon / desktop file
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # license
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('aa2525c22e9cd9dc0beb306f45e9c318e1c8b68012b6c5a4baf824bf71e66d5b'
            '131ded86296ba9ca9f4a53f433ae0f46d7f90e3bd8c17fa12810114781252f25'
            'd9f15f43f4e2475ca13c3fca9cc8a443fc9f5f5aaa52ff880cc0fb9641d5ccc6'
            '1b1443d867cde1b437d8665fd3c68a9eded75064413fa2f76fbc09ca49d26954')
