# Maintainer: Thyrum <adj00 (at) protonmail (dot) com>

pkgname=unciv-bin
_pkgname=Unciv
_pkgver=4.17.6
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
md5sums=('1c8c13e3a35dc6a12c58a719ccaf5272'
         'c3f79bbc7e80620b3cdc4f90f21f4d68'
         '7c785a8670d84014de77cf375f51ce57')

package() {
  install -Dm755 Unciv.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 unciv.desktop "$pkgdir/usr/share/applications/unciv.desktop"
  install -Dm644 $_pkgname-$_pkgver.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname-$_pkgver.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}
