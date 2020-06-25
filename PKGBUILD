# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
pkgname=xdroid-installer
pkgver=4.0082
pkgrel=1
pkgdesc="The installer and uninstaller of xDroid, a closed source Android container that uses similar techniques to Anbox."
arch=('x86_64')
url="https://www.linzhuotech.com/index.php/home/index/xdroid.html"
license=('custom')
groups=()
depends=('gtk3' 'qt5-wayland' 'qt5-virtualkeyboard' 'openssl-1.0' 'tar' 'python-easygui')
makedepends=()
optdepends=('fcitx-qt5: Asian input method support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
_filename="xDroidInstall-x86_64-v${pkgver}-20200624145405.tar.gz"
source=("https://github.com/SamLukeYes/xdroid-installer/releases/download/v${pkgver}/${_filename}"
        "${pkgname}.desktop"
        "LICENSE"
        "${pkgname}.install"
        "${pkgname}.py")
noextract=(${_filename})
md5sums=('05b605ec88b235ec81b42ef85f0945de'
         'e467770854d49aea2d94c451a443471e'
         '08c8f971fe3ae5cac148ef220975291b'
         '0daa8ce21eef5c3c4b7ffcca1433d4b1'
         'f84a84c2627ac973a3af96bd918a8f02')

package() {
  #_target=${pkgdir}/opt/${pkgname}
  cd ${pkgdir}
  install -d usr/bin opt/${pkgname} usr/share/applications usr/share/licenses/${pkgname}
  #tar -xzvf ${srcdir}/${_filename} -C ${pkgdir}/opt
  #chmod -R 755 ${pkgdir}/opt
  install -m755 ${srcdir}/${pkgname}.py usr/bin/${pkgname}
  install -m644 ${srcdir}/${_filename} opt/${pkgname}/xdroid.tar.gz
  install -m755 ${srcdir}/"${pkgname}.desktop" usr/share/applications/
  #install -Dm755 ${srcdir}/"xdroid-uninstaller.desktop" ${pkgdir}/usr/share/applications/
  install -m755 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
