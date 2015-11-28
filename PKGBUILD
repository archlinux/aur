# Maintainer : Wabuo <spam.wabuo@googlemail.com>

pkgname=thea-the-awakening-bin
name=thea-the-awakening
pkgver=unsported_build_3
pkgrel=1
pkgdesc="A turn-based strategic survival game steeped in Slavic myth. -gratis unsuported linux build"
arch=('i686' 'x86_64')
url="http://steamcommunity.com/app/378720/discussions/0/490125737485986607"
license=('custom: commercial')
source=(${name}.zip::"https://onedrive.live.com/download?resid=D09AAF078EFDC73D!2983&authkey=!AGxe3W4ByFCzWfs&ithint=file%2czip"
        "https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/thea-the-awakening/thea-the-awakening.desktop"
        "https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/thea-the-awakening/thea-the-awakening.desktop.sig"
        "https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/thea-the-awakening/LICENSE.txt"
        "https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/thea-the-awakening/LICENSE.txt.sig")
validpgpkeys=('E50EF6D35253C390580747781D3F7F8594C766C9') # Wabuo

#The devolopers don't provide any checksums! Checksums generateed by me!
sha256sums=('0556be387ea83460ff7b47b80c074bcfc66f915d31bac20c8f75144e39929a1c'
            'fe7f827e78403e163e7e4373dd6b62cd8d5a141cbddefe858c33dfac1148d8fa'
            'SKIP'
            '1259ef14c737ebc9ead6bd5d9914ca70ef2a0cac6ad9b15081cd6ac54f913520'
            'SKIP')

install=${name}$.install

package() {
  install -d "${pkgdir}/opt/games/${name}"
  install -d "${pkgdir}/usr/share/applications"

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -m755 "${srcdir}/Thea.x86_64" "${pkgdir}/opt/games/${name}"
  install -m644 "${srcdir}/${name}.desktop" "${pkgdir}/usr/share/applications/${name}.desktop"

  cp -a "Thea_Data" "${pkgdir}/opt/games/${name}"
}

