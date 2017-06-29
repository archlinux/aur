# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=0.6
pkgrel=0
pkgdesc="Audio Player based on Phonon"
arch=("x86_64")
url="https://github.com/vicr123/thebeat"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5'  'qt5-base' 'taglib')
makedepends=('git' 'clang')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thebeat.git')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/thebeat" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/thebeat.desktop" "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons"
	cp "$srcdir/$pkgname-$pkgver/icon.svg" "$pkgdir/usr/share/icons/thebeat.svg"
}
