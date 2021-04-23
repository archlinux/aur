# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch
pkgver=1.4
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/$pkgname"
license=('GPL3')
makedepends=("gcc" "pandoc")
optdepends=("viu: Display distro logos as images"
		"lshw: Better GPU detection")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheDarkBug/uwufetch/archive/$pkgver.tar.gz")
sha256sums=("1a77da7f2af313f0d87bd8ce958fd41767e6ed6126e487ba4e55cdb05c70e2fa")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
	make man
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	export DESTDIR="$pkgdir"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/share/man/man1/
    make install
}
