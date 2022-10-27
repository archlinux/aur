# Former maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Former maintainer: Prem Buczkowski <prem@prem.moe>
# Maintainer: Jaco Malan <jacom@codelog.co.za>

pkgname=visual-paradigm-163
pkgver=16.3
pkgrel=20220731
pkgdesc="Visual Paradigm version 16.3"
arch=('x86_64')
url='https://www.visual-paradigm.com/download/'
depends=('java-environment-common' 'java-runtime-common')
license=('custom')
install=visual-paradigm-community.install
conflicts=('visual-paradigm-community' 'visual-paradigm')

_ver=${pkgver/./_}

source=("https://www.visual-paradigm.com/downloads/vp${pkgver}/Visual_Paradigm_Linux64_InstallFree.tar.gz"
  'visual-paradigm-community.install'
  'visual-paradigm.desktop'
  'visual-paradigm.png'
  'x-visual-paradigm.xml')

sha256sums=('454cc5a90458e823970f487fa3b21de6f47ea20e8f953c785bf5d0701ef3144a'
            '4ffa286d87e0ea3458660dc2e781243d75cb5a110622a493db721900f61c3c88'
            'd2b1eadeb1ace06b8e6af0a13ed5bc96dc69f2e596ca00a75f4c821256872270'
            '41517b5c2326c0ba2fe3b6647f9594f094ccf03185cf73cb87d6cf19b355ff15'
            'a3b898bc9c43cf54baa1c643c619ee172a8103cd15031d574380ca463eb1ec1c')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/Visual_Paradigm_${pkgver}/Application/" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/Visual_Paradigm_${pkgver}/.install4j/" "${pkgdir}/opt/${pkgname}"
    cp "${srcdir}/Visual_Paradigm_${pkgver}/Visual_Paradigm" "${pkgdir}/opt/${pkgname}"
    ln -sr "${pkgdir}/opt/${pkgname}/Visual_Paradigm" "${pkgdir}/usr/bin/${pkgname}"
    cp "visual-paradigm.desktop" "${pkgdir}/usr/share/applications/visual-paradigm.desktop"
    cp "visual-paradigm.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/visual-paradigm.png"
    mkdir -p ${pkgdir}/usr/share/mime/packages
    cp "x-visual-paradigm.xml" "${pkgdir}/usr/share/mime/packages/x-visual-paradigm.xml"
}
