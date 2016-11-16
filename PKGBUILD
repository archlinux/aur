
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=tscheckpass
pkgver=1.3
pkgrel=0
pkgdesc="User Password Checking for tsscreenlock"
arch=("x86_64")
url="https://github.com/vicr123/tscheckpass"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/tscheckpass#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/tscheckpass" "$pkgdir/usr/bin"
	chmod u+s "$pkgdir/usr/bin/tscheckpass"
}
