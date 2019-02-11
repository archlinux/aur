# Maintainer: SanskritFritz (gmail)
# Contributor: zertyz <zertyz@gmail.com>
# Contributor: craeckie (aur.archlinux.org/account/craeckie)
# Original Author: David Fuhr <david.fuhr@web.de>

pkgname=ganttproject
pkgver=2.8.10
_build=r2364
pkgrel=2
pkgdesc="A project scheduling application featuring gantt chart, resource management, calendaring."
arch=('i686' 'x86_64')
url="http://www.ganttproject.biz/"
license=("GPL")
depends=('java-runtime')
makedepends=('unzip')
source=("http://dl.ganttproject.biz/$pkgname-$pkgver/$pkgname-$pkgver-$_build.zip"
	"ganttproject.desktop")

prepare() {
	sed -i "s|__PKGVER__|$pkgver|g" 'ganttproject.desktop'

}

package() {
	mkdir -p "$pkgdir/opt/"
	cp --recursive "$srcdir/ganttproject-$pkgver-$_build" "$pkgdir/opt/$pkgname"

	chmod 755 "$pkgdir/opt/$pkgname/ganttproject"
	install -D -m0644 "$srcdir/ganttproject.desktop" "$pkgdir/usr/share/applications/ganttproject.desktop"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/ganttproject" "$pkgdir/usr/bin/ganttproject"
}

md5sums=('aa04f3318403d6d3a0dbb2749f055942'
         '48414b17ae6d8c7ddc29d8e2094d86e5')
