# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
pkgname=xdroid-installer
pkgver=4.0012
pkgrel=1
pkgdesc="The installer and of xDroid, a closed source Android container that uses similar techniques to Anbox."
arch=('x86_64')
url="https://www.linzhuotech.com/index.php/home/index/xdroid.html"
license=('custom')
groups=()
depends=('bash' 'gtk3' 'qt5-wayland' 'qt5-virtualkeyboard' 'openssl-1.0' 'tar')
makedepends=()
optdepends=('fcitx-qt5: Asian input method support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="xdroid-installer.install"
changelog=
_filename="xDroidInstall-x86_64-v${pkgver}-20200527143515.tar.gz"
source=("https://github.com/SamLukeYes/xdroid-installer/releases/download/v${pkgver}/${_filename}"
        "xdroid-installer.desktop"
        "LICENSE"
        "xdroid-installer.install")
noextract=(${_filename})
md5sums=('a269cff11068cd6f4898f74a48bf8a15'
         'afd3661413c83b55bf160d0ea5244366'
         '08c8f971fe3ae5cac148ef220975291b'
         '6593491b69238c60428a928e54d3a5ad')

package() {
  #_target=${pkgdir}/opt/${pkgname}
  install -d ${pkgdir}/opt/${pkgname}
  #tar -xzvf ${srcdir}/${_filename} -C ${pkgdir}/opt
  #chmod -R 755 ${pkgdir}/opt
  install -Dm644 ${srcdir}/${_filename} ${pkgdir}/opt/${pkgname}/xdroid.tar.gz
  install -d ${pkgdir}/usr/share/applications
  install -Dm755 ${srcdir}/"xdroid-installer.desktop" ${pkgdir}/usr/share/applications/
  #install -Dm755 ${srcdir}/"xdroid-uninstaller.desktop" ${pkgdir}/usr/share/applications/
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm755 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
