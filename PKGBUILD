# Maintainer: Darkpelz
pkgname=uwufetch-git
pkgver=r50.ee22b5d
pkgrel=2
pkgdesc="A meme system info tool for Linux, based on nyan/uwu trend on r/linuxmasterrace."
arch=('any')
url="https://github.com/TheDarkBug/${pkgname/-git/}"
license=('GPL3')
makedepends=("gcc")
source=("$pkgname"::'git+https://github.com/TheDarkBug/uwufetch.git')
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make build
}

package() {
	cd "$srcdir/${pkgname}"
	install -D "uwufetch" "$pkgdir/usr/bin/uwufetch"
}
