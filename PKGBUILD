# Maintainer : Wabuo <spam.wabuo@googlemail.com>

pkgname=thea-the-awakening-bin
name=thea-the-awakening
pkgver=1.RC51118.1
pkgrel=5
pkgdesc="A turn-based strategic survival game steeped in Slavic myth. -gratis unsuported linux build"
arch=('i686' 'x86_64')
url="http://steamcommunity.com/app/378720/discussions/0/490125737485986607"
license=('freeware')
source=(${name}.zip::"https://onedrive.live.com/download?resid=D09AAF078EFDC73D!2983&authkey=!AGxe3W4ByFCzWfs&ithint=file%2czip"
        "https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/thea-the-awakening/thea-the-awakening.desktop"
        "https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/thea-the-awakening/thea-the-awakening.desktop.sig")
validpgpkeys=('E50EF6D35253C390580747781D3F7F8594C766C9') # Wabuo

#The devolopers don't provide any checksums! Checksums generateed by me!
sha256sums=('0556be387ea83460ff7b47b80c074bcfc66f915d31bac20c8f75144e39929a1c'
            'd613dcdbaf0dae16229ada565d065ea983dbbc63efac9aae1e5246561b2ead11'
            'SKIP')

install=${name}.install

package() {
  install -d "${pkgdir}/opt/games/${name}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"

  arch=`uname -m`
  if [ $arch == i686 ];then
  	    install -m755 "${srcdir}/Thea.x86" "${pkgdir}/opt/games/${name}"
        ln -s "/opt/games/${name}/Thea.x86" "${pkgdir}/usr/bin/${name}"
  elif [ $arch == x86_64 ];then
  	    install -m755 "${srcdir}/Thea.x86_64" "${pkgdir}/opt/games/${name}"
        ln -s "/opt/games/${name}/Thea.x86_64" "${pkgdir}/usr/bin/${name}"
  fi

  install -m644 "${srcdir}/${name}.desktop" "${pkgdir}/usr/share/applications/${name}.desktop"

  cp -a "Thea_Data" "${pkgdir}/opt/games/${name}"
}
