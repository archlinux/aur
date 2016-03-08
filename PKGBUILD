# Maintainer: SaMaLerO <ivan[dot]barabash96[at]mail[dot]ru>
pkgname=tlauncher
pkgver=1.7
pkgrel=2
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
source=("TLauncher.jar::http://tlaun.ch/jar"
        "tlauncher.desktop::https://drive.google.com/uc?export=download&id=0BwXQWEVmNM9ddTlVM1Q0TGJmT0k"
	"mncrft.png::https://drive.google.com/uc?export=download&id=0BwXQWEVmNM9dWm1sbGtoQ29CVTA")
noextract=('TLauncher.jar')
md5sums=('485329f383ac31f0ae8eec4a19b70073'
         '679caa7ce6fd3f3ba1f5e57d71de97e1'
	 '7ad17a837b4a3742a84a34ecd7160665')

package() {
  mkdir -p $pkgdir/opt/TLauncher
  desktop-file-install tlauncher.desktop --dir "$pkgdir/usr/share/applications/"
  install -Dm0644 mncrft.png "$pkgdir/opt/TLauncher/mncrft.png"
  install -Dm0644 tlauncher.desktop "$pkgdir/usr/share/applications/tlauncher.desktop"
  install -Dm0644 TLauncher.jar "$pkgdir/opt/TLauncher/TLauncher.jar"
}
