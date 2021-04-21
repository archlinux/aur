# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch
pkgver=1.3
pkgrel=3
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/$pkgname"
license=('GPL3')
depends=('json-c')
makedepends=("gcc" "pandoc")
optdepends=("viu: Display distro logos as images"
		"lshw: Better GPU detection")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheDarkBug/uwufetch/archive/$pkgver.tar.gz")
sha256sums=("34e9742e9c845dd4948c48115be4eee7ce427a29ac80ec72a7f3d62d25dcd760")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	export DESTDIR="$pkgdir"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/share/man/man1/
    make install
}
