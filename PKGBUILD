# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.7
pkgrel=1
pkgdesc="The vim like browser"
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('libsoup' 'webkitgtk')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/fanglingsu/$pkgname/tar.gz/$pkgver")
sha256sums=('f9a3d946642658d85a40469692d9b45e217d09c4c3e3232051efe52350ba2516')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make GTK=3
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
