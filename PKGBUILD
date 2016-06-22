#Package from: Marc Tiehuis <https://github.com/tiehuis>
#AUR Maintainter: JKA Network <contacto@jkanetwork.com>
pkgname=2048-cli-git
_pkgname=2048-cli
_pkgname2=2048
pkgver=20160621
pkgrel=1
pkgdesc="The game 2048 for your Linux terminal"
arch=('x86_64' 'i686')
url="https://github.com/tiehuis/2048-cli"
license=('MIT')
depends=('ncurses' 'sdl')
makedepends=('git')
provides=('2048-cli')
conflicts=('2048.c' '2048.c.git')
options=()
source=(git+https://github.com/tiehuis/2048-cli.git)
md5sums=('SKIP')
build() {
	cd "$srcdir"/"$_pkgname"
	make
	cd man
	gzip "$_pkgname2".1
}
package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir"/usr/{bin,share,}
	mkdir -p "$pkgdir"/usr/share/man/man1
	install -Dm755 "$_pkgname2" "$pkgdir"/usr/bin
	install -Dm644 man/"$_pkgname2".1.gz "$pkgdir"/usr/share/man/man1
}
