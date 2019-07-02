# Maintainer: Iztech LLC <iztech@iztech.ru>
pkgname=mit8
orgname=Iztech
pkgver=3.0.0
pkgrel=1
pkgdesc="Программа для управления измерителями температуры серии МИТ-8 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5" "qt5-serialport")
arch=('x86_64')
options=('!strip')
makedepends=("gendesk")
source=("$url/content/files/mit8-3.0.0-x86_64.tar.gz")
md5sums=('2d360771460304ef0dda2cd4f0b9b22c')

prepare() {
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories=Utility PKGBUILD
}

package() {
  install -Dm755 "$srcdir/mit8" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$pkgname/LICENSE"
  install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$pkgname/COPYING.LESSER"
  install -Dm644 "$srcdir/resource/Manual_MIT8.pdf" "$pkgdir/usr/share/$orgname/$pkgname/docs/Manual_MIT8.pdf"
  install -Dm644 "$srcdir/resource/template/sqlite.db" "$pkgdir/usr/share/$orgname/$pkgname/template/sqlite.db"
  install -Dm644 "$srcdir/mit8.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/mit8.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"

}
