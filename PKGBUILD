# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theslate
pkgver=0.2
pkgrel=0
pkgdesc="Text Editor with code highlighting support"
arch=("x86_64")
url="https://github.com/vicr123/theslate"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'qtermwidget')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theslate.git')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/theslate" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/theslate.desktop" "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons"
	cp "$srcdir/$pkgname-$pkgver/icons/icon.svg" "$pkgdir/usr/share/icons/theslate.svg"
}
