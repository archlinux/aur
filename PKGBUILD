# Maintainer: Aron de Jong <adj00@protonmail.com>

pkgname=unciv-bin
_pkgname=Unciv
_pkgver=3.14.12
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
  "$_pkgname.jar::https://github.com/yairm210/Unciv/releases/download/$_pkgver/Unciv.jar"
  "unciv.png::https://raw.githubusercontent.com/yairm210/Unciv/$_pkgver/extraImages/Unciv%20icon%20v4.png"
  "$_pkgname.sh"
  "$_pkgname.desktop"
)
md5sums=('21d378a05c0507237ced5a5c04257b75'
         '5aca7fc33f121fcf901fef14f784731a'
         'f8eab098f20681b8db232cc5709713d3'
         '42d5f7ea8ee48d2d643d070786f039ba')

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 unciv.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}

