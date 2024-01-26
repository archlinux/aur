# Maintainer: Iztech LLC <iztech@iztech.ru>
appname=mit8
pkgname=$appname-bin
orgname=Iztech
pkgver=3.4.3
pkgrel=1
pkgdesc="Программа для управления измерителями температуры серии МИТ-8 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
arch=("x86_64")
options=("strip")
replaces=("mit8")
source=("$url/content/files/app/$pkgname-x86_64.tar.gz")
md5sums=("e57ba396c631f59b0ebaad47bf8ce8a9")


package() {
	install -Dm755 "$srcdir/mit8" "$pkgdir/usr/bin/$appname"
	install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$appname/LICENSE"
	install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$appname/COPYING.LESSER"
	install -Dm644 "$srcdir/resource/Manual_MIT8.pdf" "$pkgdir/usr/share/$orgname/$appname/docs/Manual_MIT8.pdf"
	install -Dm644 "$srcdir/resource/mit8.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/resource/mit8.svg" "$pkgdir/usr/share/pixmaps/$appname.svg"
}