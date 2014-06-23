# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.5
pkgrel=1
pkgdesc="Vimb is a WebKit-based web browser"
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('libsoup' 'webkitgtk')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/fanglingsu/$pkgname/tar.gz/$pkgver")
sha256sums=('296550d91db63c3031d2222cf479b48f97ac7758e0c8a3d42aa48bdf8fef83b0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make GTK=3
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
