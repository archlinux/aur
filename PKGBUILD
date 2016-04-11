
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thefile
pkgver=2.1
pkgrel=0
pkgdesc="Simple File Manager"
arch=("x86_64")
url="https://github.com/vicr123/thefile"
license=('GPL2')
depends=('kwidgetsaddons' 'xdg-utils')
makedepends=('qtchooser' 'git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thefile#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/thefile" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/theFile.desktop" "$pkgdir/usr/share/applications"
}
