# Maintainer: Iztech LLC <iztech@iztech.ru>
appname=mit8_30
pkgname=$appname-bin
orgname=Iztech
pkgver=1.3.13
pkgrel=1
pkgdesc="Программа для управления измерителями температуры серии МИТ 8.30 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
arch=("x86_64")
options=("strip" "!debug")
replaces=("mit8_30")
source=("$url/content/files/app/$pkgname-linux-x86_64.tar.gz")
md5sums=("b71c2475e84a90c5128c9b65f6c3541d")

package() {
	install -Dm755 "$srcdir/mit8_30" "$pkgdir/usr/bin/$appname"
	install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$appname/LICENSE"
	install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$appname/COPYING.LESSER"
	install -Dm644 "$srcdir/resource/mit8_30.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/resource/mit8_30.svg" "$pkgdir/usr/share/pixmaps/$appname.svg"
}