# Maintainer: Kazel <address at domain dot tld>
pkgname=nvidia-launcher
pkgver=0.7
pkgrel=1
pkgdesc="Launch applications with NVIDIA graphics card"
arch=(x86_64)
url="https://gitlab.com/WheelchairArtist/nvidia-launcher"
license=('GPL2')
depends=(kdialog bumblebee)
makedepends=(gendesk)
optdepends=(primusrun)
changelog=
source=(https://gitlab.com/WheelchairArtist/$pkgname/raw/$pkgver/nvidia-launcher)
noextract=()
sha256sums=('807fe8c271e82ce0c258845273af452e3a0775bfda4cea89405e20d315dde172')


prepare() {
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" --name="Nvidia Launcher" --comment="$pkgdesc" --exec="/usr/bin/$pkgname" --categories="Utility"
}


package() {
  install -Dm 755 -o root -g root nvidia-launcher "$pkgdir/usr/bin/nvidia-launcher"
  install -Dm 644 -o root -g root "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm 644 -o root -g root "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
