# Maintainer: SaMaLerO <ivan.barabash96[at]mail[dot]ru>
pkgname=tlauncher
pkgver=1.641
pkgrel=1
pkgdesc="TLauncher is freeware launcher of Minecraft."
url="http://vk.com/tlauncher"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('jre8-openjdk')
makedepends=()
conflicts=()
replaces=()
backup=()
install='tlauncher.install'
source=("TLauncher.jar::http://tlauncher.ru/download/jar"
        "tlauncher.desktop::https://drive.google.com/uc?export=download&id=0BwXQWEVmNM9ddEZIeUdaVzFoQWc")
noextract=('TLauncher.jar')
md5sums=('7328295452ce7d0ad9e1572343385b5a'
         'dec61181650419e28df05736c30a8a49')

package() {
  mkdir -p $pkgdir/opt/TLauncher
  desktop-file-install tlauncher.desktop --dir "$pkgdir/usr/share/applications/"
  install -Dm0644 tlauncher.desktop "$pkgdir/usr/share/applications/tlauncher.desktop"
  install -Dm0644 TLauncher.jar "$pkgdir/opt/TLauncher/TLauncher.jar"
}
