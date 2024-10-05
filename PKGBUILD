# Based on katawa-shoujo-bin PKGBUILDs written by Alice Jenkinson <virtual.aur at zero-x dot nz>, with katawa-shoujo by Cravix < dr dot neemous at gmail dot com > as reference for non-bundled dependencies
# Maintainer: snit <snit@cock.li>

pkgname=katawa-shoujo-reengineered
pkgver=1.4.8
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

sha512sums=(
    "f6a4f1d47ad86df7dc17abd7542d61cbddbd8ef2aa8fca32e94df5738cab09eecd79da9eb5aaa0563815b2056a09cce3281289b04b8e587133db582e1cac8071"
    "7077fd0d4c23ae5fd5e42acc2174dd7ec68d630a0842fb10aa1b97e8f5d48353e60d4a40ed6b02391de86d2ea2ee81e52acb0742ba411d17105d2d203bf75f2d"
    "e4c4413fd9418adf91b97b5d23f3f30008fff909a7b0e3190be5d56b2b163d81cfefe78981dbad42562b749de0f5666596b582a0476c649d138f512068e1bbe6"
    "a1e5d6f0662955fe5abd48b5d0e3f3d82faa3c6f6f845fefe5facad93a7ba42f2b682dd52845189432f4328ccef437d786ed942aaaee44d97df86acd47a9bc03"
)
