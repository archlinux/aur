# Maintainer: Thyrum <adj00 (at) protonmail (dot) com>

pkgname=unciv-bin
_pkgname=Unciv
_pkgver=3.15.18
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Open-source remake of Civilization V"
url="https://github.com/yairm210/Unciv"
license=('MPL-2.0')
depends=('jre8-openjdk' 'bash' 'xorg-xrandr')
provides=('unciv')
conflicts=('unciv')
arch=('any')
source=(
  "$_pkgname-$_pkgver.jar::https://github.com/yairm210/Unciv/releases/download/$_pkgver/Unciv.jar"
  "unciv-$_pkgver.png::https://raw.githubusercontent.com/yairm210/Unciv/$_pkgver/extraImages/Unciv%20icon%20v4.png"
  "$_pkgname.sh"
  "$_pkgname.desktop"
)
noextract=(
	"$_pkgname-$_pkgver.jar"
)
md5sums=('091bceb2b7aebc570fbba2772caee06a'
         '5aca7fc33f121fcf901fef14f784731a'
         'f8eab098f20681b8db232cc5709713d3'
         '42d5f7ea8ee48d2d643d070786f039ba')

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 unciv-$_pkgver.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname-$_pkgver.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}

