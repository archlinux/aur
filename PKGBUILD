# Based on katawa-shoujo-bin PKGBUILDs written
# by Alice Jenkinson <virtual.aur at zero-x dot nz>,
# with katawa-shoujo by Cravix < dr dot neemous at gmail dot com >
# as reference for non-bundled dependencies
# Maintainer: snit <snit@cock.li>

pkgname=katawa-shoujo-reengineered
pkgver=2.0.1
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
    'cb9fe41d53f52d8853dc03c0bad65e5e4a93414ebde2700d0b99193db8276dced5a3e99b5c3de3e32591b14734f6983ed63f29e1efe2c3e1d841bf1c1d220a40'
    '7077fd0d4c23ae5fd5e42acc2174dd7ec68d630a0842fb10aa1b97e8f5d48353e60d4a40ed6b02391de86d2ea2ee81e52acb0742ba411d17105d2d203bf75f2d'
    'e4c4413fd9418adf91b97b5d23f3f30008fff909a7b0e3190be5d56b2b163d81cfefe78981dbad42562b749de0f5666596b582a0476c649d138f512068e1bbe6'
    'a1e5d6f0662955fe5abd48b5d0e3f3d82faa3c6f6f845fefe5facad93a7ba42f2b682dd52845189432f4328ccef437d786ed942aaaee44d97df86acd47a9bc03'
)
