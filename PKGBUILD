# Maintainer: SaMaLerO <smlr[at]ukr[dot]net>
pkgname=tlauncher
pkgver=9999
pkgrel=3
pkgdesc="TLauncher is freeware launcher of Minecraft."
url="https://tlaun.ch"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=("java-runtime>=8" "xorg-xrandr")
makedepends=()
conflicts=()
replaces=()
backup=()
install='tlauncher.install'
source=("TLauncher.jar::https://tlaun.ch/download.php?&package=jar"
        "tlauncher.desktop::https://drive.google.com/uc?export=download&id=0BwXQWEVmNM9ddTlVM1Q0TGJmT0k"
		"mncrft.png::https://drive.google.com/uc?export=download&id=0BwXQWEVmNM9dWm1sbGtoQ29CVTA")
noextract=('TLauncher.jar')
md5sums=('SKIP'
		'679caa7ce6fd3f3ba1f5e57d71de97e1'
		'7ad17a837b4a3742a84a34ecd7160665')

package() {
  mkdir -p $pkgdir/opt/TLauncher
  desktop-file-install tlauncher.desktop --dir "$pkgdir/usr/share/applications/"
  install -Dm0644 mncrft.png "$pkgdir/opt/TLauncher/mncrft.png"
  install -Dm0644 tlauncher.desktop "$pkgdir/usr/share/applications/tlauncher.desktop"
  install -Dm0666 TLauncher.jar "$pkgdir/opt/TLauncher/TLauncher.jar"
}
