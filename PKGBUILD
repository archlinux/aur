# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch
pkgver=1.5
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/$pkgname"
license=('GPL3')
makedepends=("gcc" "pandoc")
optdepends=("viu: Display distro logos as images"
		"lshw: Better GPU detection")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheDarkBug/uwufetch/archive/$pkgver.tar.gz")
sha256sums=("3cdbfc12dc08e6b36b1844644c72e78a95d331ec2f50dfc7b00c7b6a73803034")

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
