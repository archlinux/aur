# Maintainer: myname <mebitek@zohomail.eu>
pkgname=tui-deck
_gitname=tui-deck
pkgver=0.5.8
pkgrel=1
pkgdesc="A TUI frontend for Nextcloud Deck app written in GO using the Rich Interactive Widgets for Terminal UIs"
url="https://github.com/mebitek/tui-deck"
license=("GPL3")
source=("git+$url#tag=$pkgver")
md5sums=("SKIP")
arch=("x86_64")
depends=("bash")
makedepends=("git" "go")

build() {
	cd $_gitname
	go build -o ${pkgname} -ldflags="-s -w"
}

package() {
	cd $_gitname
	install -Dm755 --no-target-directory "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
