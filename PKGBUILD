
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thepackage
pkgver=2.1
pkgrel=0
pkgdesc="Simple Package Manager that invokes Pacman directly"
arch=("x86_64")
url="https://github.com/vicr123/thepackage"
license=('GPL2')
depends=('qt5-base' 'xdg-utils' 'wget' 'package-query' 'git')
makedepends=('qtchooser')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thepackage#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/thepackage" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/thePackage.desktop" "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/thePackageUpdate.desktop" "$pkgdir/usr/share/applications"
}
