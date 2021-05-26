# Maintainer: Aron de Jong <adj00@protonmail.com>

pkgname=unciv-bin
_pkgname=Unciv
pkgver=3.14.10
pkgrel=1
pkgdesc="Open-source remake of Civilization V"
url="https://github.com/yairm210/Unciv"
license=('MPL-2.0')
depends=('jre8-openjdk' 'bash' 'xorg-xrandr')
provides=('unciv')
conflicts=('unciv')
arch=('any')
source=(
  "$_pkgname.jar::https://github.com/yairm210/Unciv/releases/download/${pkgver//_/-}/Unciv.jar"
  "unciv.png::https://raw.githubusercontent.com/yairm210/Unciv/${pkgver//_/-}/extraImages/Unciv%20icon%20v4.png"
  "$_pkgname.sh"
  "$_pkgname.desktop"
)
md5sums=('7c1541523454891b8dc58487033e0506'
         '5aca7fc33f121fcf901fef14f784731a'
         'f8eab098f20681b8db232cc5709713d3'
         '42d5f7ea8ee48d2d643d070786f039ba')

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 unciv.png "$pkgdir/usr/share/pixmaps/unciv.png"
  install -Dm644 $_pkgname.jar "$pkgdir/usr/share/$_pkgname/$_pkgname.jar"
}

