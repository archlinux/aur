# Maintainer: Thyrum <adj00 (at) protonmail (dot) com>

pkgname=unciv-bin
_pkgname=Unciv
_pkgver=4.15.17
pkgver=${_pkgver//-/_}
pkgrel=0
pkgdesc="Open-source remake of Civilization V"
url="https://github.com/yairm210/Unciv"
license=('MPL-2.0')
depends=('java-runtime' 'bash' 'xorg-xrandr')
provides=('unciv')
conflicts=('unciv')
arch=('any')
source=(
  "$_pkgname-$_pkgver.jar::https://github.com/yairm210/$_pkgname/releases/download/$_pkgver/Unciv.jar"
  "$_pkgname-$_pkgver.png::https://raw.githubusercontent.com/yairm210/$_pkgname/$_pkgver/extraImages/Icons/Unciv%20icon%20v5.png"
  "$_pkgname-$_pkgver.zip::https://github.com/yairm210/$_pkgname/releases/download/$_pkgver/linuxFilesForJar.zip"
)
noextract=(
	"$_pkgname-$_pkgver.jar"
)
md5sums=('9f1b1bfce76ff9e16d0dd4d0732daa66'
         'c3f79bbc7e80620b3cdc4f90f21f4d68'
         'ddf1d8858ad6797cc89d8f5aa8c80d81')

package() {
  install -Dm755 Unciv.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 unciv.desktop "$pkgdir/usr/share/applications/unciv.desktop"
  install -Dm644 $_pkgname-$_pkgver.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname-$_pkgver.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}
