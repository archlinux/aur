# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
pkgname=xdroid-installer
pkgver=4.0078
pkgrel=1
pkgdesc="The installer and uninstaller of xDroid, a closed source Android container that uses similar techniques to Anbox."
arch=('x86_64')
url="https://www.linzhuotech.com/index.php/home/index/xdroid.html"
license=('custom')
groups=()
depends=('gtk3' 'qt5-wayland' 'qt5-virtualkeyboard' 'openssl-1.0' 'tar' 'python')
makedepends=()
optdepends=('fcitx-qt5: Asian input method support'
            'python-easygui: for choosing to reinstall or uninstall after the first installation')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
_filename="xDroidInstall-x86_64-v${pkgver}-20200620101733.tar.gz"
source=("https://github.com/SamLukeYes/xdroid-installer/releases/download/v${pkgver}/${_filename}"
        "${pkgname}.desktop"
        "LICENSE"
        "${pkgname}.install"
        "${pkgname}.py")
noextract=(${_filename})
md5sums=('f6941c16177c72e376ffd105677cd75c'
         'e467770854d49aea2d94c451a443471e'
         '08c8f971fe3ae5cac148ef220975291b'
         '025974b0e37da69e031e6ec1e346fef8'
         '74c526e3fadfeb135faf1f2826daf33b')

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
