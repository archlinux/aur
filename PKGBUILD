# Maintainer: Iztech LLC <iztech@iztech.ru>
appname=kt5
pkgname=$appname-bin
orgname=Iztech
pkgver=2.0.33
pkgrel=1
pkgdesc="Программа для управления калибраторами температуры серии КТ-5 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
arch=("x86_64")
options=("strip" "!debug")
source=("$url/content/files/app/$pkgname-linux-x86_64.tar.gz")
md5sums=("f2021adcee0041a313aeed122c12cd72")

package() {
	install -Dm755 "$srcdir/kt5" "$pkgdir/usr/bin/$appname"
	install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$appname/LICENSE"
	install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$appname/COPYING.LESSER"
	install -Dm644 "$srcdir/resource/kt5.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/resource/kt5.svg" "$pkgdir/usr/share/pixmaps/$appname.svg"
}