# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch
pkgver=1.3
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/$pkgname"
license=('GPL3')
makedepends=("gcc")
optdepends=("viu: Display distro logos as images"
		"lshw: Better GPU detection"
		"pandoc: Building man page"
		"json-c: Parsing config.json")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheDarkBug/uwufetch/archive/$pkgver.tar.gz")
sha256sums=("34e9742e9c845dd4948c48115be4eee7ce427a29ac80ec72a7f3d62d25dcd760")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D "uwufetch" "$pkgdir/usr/bin/uwufetch"
	install -D "uwufetch.1.gz" "$pkgdir/usr/share/man/man1/uwufetch.1"
	install -d "$pkgdir/usr/lib/uwufetch"
	install res/* "$pkgdir/usr/lib/uwufetch"
}
