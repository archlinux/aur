# Former maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Former maintainer: Prem Buczkowski <prem@prem.moe>
# Maintainer: Jaco Malan <jacom@codelog.co.za>

pkgname=visual-paradigm-163
pkgver=16.3
pkgrel=20230323
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
            'd49752a05bc69e7e5f7b23875b6ac7d7d242d761ee00030b57e9ca057babb43e'
            'fff88b05529a391dad757b380d7acf08703e11d441e04c3886e4db7f5bcd1729'
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
