# Maintainer: Jhyub <seojanghyeob at gmail dot com>

pkgname='ttf-nexon'
pkgver=5
pkgrel=2
pkgdesc="The Level Up series TrueType fonts provided by Nexon."
arch=('any')
url="http://levelup.nexon.com/"
license=('custom:NEXON')
source=(
    "http://s.nexon.com/s2/levelup/fontSite/files/Lv1Gothic/NEXON_Lv1_Gothic_total.zip"
    "http://s.nexon.com/s2/levelup/fontSite/files/Lv2Gothic_ver200609/NEXON_Lv2_Gothic_total.zip"
    "http://s.nexon.com/s2/levelup/fontSite/files/BazziFont/BazziFont_total.zip"
    "http://s.nexon.com/s2/levelup/fontSite/files/MaplestoryFont/MaplestoryFont_TTF.zip"
    "LICENSE"
)
sha256sums=(
    'b19577427d69b68ef6d20970ef4fdb6d3e8f3db5b18392a3705b8f3a070d9f3b'
    '82b9b2b238ec94f7d8786fa8f10bc7eb26a2d25e8ce7daa5ba687d0669892573'
    '5a10a91d8cf3480f947509858d760af98204678c26a52e1381a7fff9a2eefc8e'
    '4aaa464d6d7a31d3f3d23dddeefada69064300087b5ea5ebc575952594b5755a'
    '81d0fc81e9a2a8b327d1749bace49c122b728c6000e46c72b4807895328d8585'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}/NEXON Lv1 Gothic_OTF_TTF/NEXON Lv1 Gothic_TTF"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}/NEXON_Lv2_Gothic_total/A_NEXON_Lv2_Gothic"/*.ttf
    bsdtar -x -f "${srcdir}/A_BAZZI_Font.zip"
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}"/*.ttf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
}
