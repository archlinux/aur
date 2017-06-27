# Maintainer: Pietro Francesco Fontana <pietrofrancesco.fontana@studenti.unimi.it>

_pkgname=cleanupdate
pkgname=cleanupdate-git
pkgver=r114.0396731
pkgrel=0
pkgdesc="A simple script to speed up updating and cleaning your system"
arch=('any')
url="https://github.com/cubanpit/$_pkgname"
license=('GPL3')
depends=('ncurses'
		'sudo'
		'bash')
makedepends=('git')
optdepends=('yaourt: needed for AUR support (alternative to pacaur)'
			'pacaur: needed for AUR support (preferred to yaourt)')
conflicts=()
source=("git://github.com/cubanpit/$_pkgname")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package () {
	cd "$srcdir"
	install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"16.png "$pkgdir/usr/share/icons/hicolor/16x16/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"24.png "$pkgdir/usr/share/icons/hicolor/24x24/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"32.png "$pkgdir/usr/share/icons/hicolor/32x32/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"48.png "$pkgdir/usr/share/icons/hicolor/48x48/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"64.png "$pkgdir/usr/share/icons/hicolor/64x64/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"128.png "$pkgdir/usr/share/icons/hicolor/128x128/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname"256.png "$pkgdir/usr/share/icons/hicolor/256x256/$_pkgname.png"
	install -Dm644 "$srcdir/$_pkgname/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/$_pkgname.svg"
}
