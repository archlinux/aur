# Maintainer: Hexawolf <hexawolf@protonmail.com>

pkgname=pause
pkgver=1.0.0
pkgrel=1
pkgdesc="Wait for signal"
arch=('any')
url="https://hexawolf.dev/post/pause"
license=('Unlicense')
makedepends=('dietlibc' 'binutils' 'gcc')
provides=('pause')
source=("pause.c")
sha256sums=('SKIP')

build() {
	diet -Os gcc -Wl,--gc-sections -ffunction-sections -fdata-sections pause.c -o pause
	strip -s -R .comment -R .gnu.version pause
}

package() {
	install -D -m 755 pause -t "${pkgdir}/usr/bin"
}
