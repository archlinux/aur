# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.6
pkgrel=1
pkgdesc="The vim like browser"
arch=('i686' 'x86_64')
url="http://fanglingsu.github.io/vimb"
license=('GPL3')
depends=('libsoup' 'webkitgtk')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/fanglingsu/$pkgname/tar.gz/$pkgver")
sha256sums=('412862b515f2e321378538f7f7499bdeaa096a3ef2afb5c794a2cc315da9dfbc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make GTK=3
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
