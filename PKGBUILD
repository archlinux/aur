# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=themedia
pkgver=1.2
pkgrel=0
pkgdesc="Media Player based on Phonon"
arch=("x86_64")
url="https://github.com/vicr123/themedia"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'phonon-qt5'  'qt5-base')
makedepends=('qtchooser' 'git' 'clang')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/themedia.git')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/themedia" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/themedia.desktop" "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons"
	cp "$srcdir/$pkgname-$pkgver/icon.svg" "$pkgdir/usr/share/icons/themedia.svg"
}
