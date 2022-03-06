# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=drawterm
pkgver=20210326
pkgrel=2
pkgdesc="Connect to Plan 9 CPU servers from other operating systems."
provides=($pkgname)
conflicts=("${pkgname%-*}" "${pkgname%-*}-hg")
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(git)
url='https://github.com/9fans/drawterm'
source=("git+$url#commit=fa5671bcef0970e0b143745d9fbac195cb7626e6")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	CONF=unix make
}

package() {
	cd "$pkgname"
	install -Dm755 drawterm "$pkgdir"/usr/bin/drawterm
	install -Dm644 drawterm.ico "$pkgdir"/usr/share/pixmaps/drawterm.ico
}
