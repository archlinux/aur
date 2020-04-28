# Maintainer: SanskritFritz (gmail)
# Contributor: zertyz <zertyz@gmail.com>
# Contributor: craeckie (aur.archlinux.org/account/craeckie)
# Contributor: Oliver Kahrmann <oliver.kahrmann@gmail.com>
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
pkgver=2.8.11
_build=r2393
pkgrel=1
pkgdesc="A project scheduling application featuring gantt chart, resource management, calendaring."
arch=('i686' 'x86_64')
url="http://www.ganttproject.biz/"
license=("GPL")
depends=('java-runtime')
makedepends=('unzip')
source=("http://dl.ganttproject.biz/$pkgname-$pkgver/$pkgname-$pkgver-$_build.zip"
	"ganttproject.desktop")

package() {
	mkdir -p "$pkgdir/opt/"
	cp --recursive "$srcdir/ganttproject-$pkgver-$_build" "$pkgdir/opt/$pkgname"

	chmod 755 "$pkgdir/opt/$pkgname/ganttproject"
	install -D -m0644 "$srcdir/ganttproject.desktop" "$pkgdir/usr/share/applications/ganttproject.desktop"
	install -D -m0644 "$srcdir/ganttproject-$pkgver-$_build/plugins/$pkgver/ganttproject/data/resources/icons/ganttproject.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ganttproject.png"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ganttproject" "$pkgdir/usr/bin/ganttproject"
}

md5sums=('2da0e6dfc9580f45646629e9619f5843'
         '5139adddebc92d9da94b8448176d4d21')
