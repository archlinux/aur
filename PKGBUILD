# Maintainer: Darkpelz <lukeh@outlook.my>
# Maintainer: TheDarkBug <adrianoliviero23@gmail.com>
pkgname=uwufetch
pkgver=1.1
pkgrel=1
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/$pkgname"
license=('GPL3')
makedepends=("gcc")
optdepends=("viu: Display distro logos as images")
conflicts=('uwufetch-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheDarkBug/uwufetch/archive/$pkgver.tar.gz")
sha256sums=("6d2f14c4f91392df0316681a787e4b126f04dd7a3a5c36390331c4c32ed4df70")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D "uwufetch" "$pkgdir/usr/bin/uwufetch"
	install -d "$pkgdir/usr/lib/uwufetch"
	install res/* "$pkgdir/usr/lib/uwufetch"
}
