# Current Maintainer: sigmacool
# Original Packager: sigmacool

pkgname=lanshare
pkgver=1.2.1
pkgrel=1
pkgdesc="LAN Share is a cross platform local area network file transfer application, built using Qt GUI framework."
arch=('x86_64')
url="https://github.com/abdularis/LAN-Share"
license=('GPL')
depends=()
optdepends=()
options=()
source=(
		"https://github.com/abdularis/LAN-Share/releases/download/1.2.1/lanshare_1.2.1-1_amd64.deb"
        "https://raw.githubusercontent.com/abdularis/LAN-Share/master/packaging/linux/debian/LANShare.desktop"
        "https://raw.githubusercontent.com/abdularis/LAN-Share/master/packaging/linux/debian/lanshare-icon.png"
)        
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {

  tar xf  data.tar.xz 
  chmod -R 755 usr/
  chmod -R 775 usr/lib/LANShare
  mv usr/ "$pkgdir"

  install -Dm 0755 "$pkgdir/usr/lib/LANShare/LANShare" "$pkgdir/usr/bin/LANShare"

  mkdir -p "$pkgdir/usr/share/applications"
  sed -i '$ d' LANShare.desktop
  install -Dm 0755  LANShare.desktop "$pkgdir/usr/share/applications/LANShare.desktop"

  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -Dm 0755 lanshare-icon.png "$pkgdir/usr/share/pixmaps/lanshare-icon.png"
}

