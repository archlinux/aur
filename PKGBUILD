# Maintainer: Thyrum <adj00 (at) protonmail (dot) com>

pkgname=unciv-bin
_pkgname=Unciv
_pkgver=4.5.12
pkgver=${_pkgver//-/_}
pkgrel=0
pkgdesc="Open-source remake of Civilization V"
url="https://github.com/yairm210/Unciv"
license=('MPL-2.0')
depends=('java-environment' 'bash' 'xorg-xrandr')
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
md5sums=('001461aab3c56daf385da5ec6556b432'
         'c3f79bbc7e80620b3cdc4f90f21f4d68'
         '3e8a512c09733f3f7f28dc7fed467f97')

package() {
  install -Dm755 Unciv.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 unciv.desktop "$pkgdir/usr/share/applications/unciv.desktop"
  install -Dm644 $_pkgname-$_pkgver.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname-$_pkgver.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}
