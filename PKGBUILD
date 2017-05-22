# Maintainer: Pietro Francesco Fontana <pietrofrancesco.fontana@studenti.unimi.it>

_pkgname=cleanupdate
pkgname=cleanupdate-git
pkgver=r89.4bb715b
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
	install -Dm644 "$srcdir/$_pkgname/$_pkgname.png" "$pkgdir/usr/share/icons/$_pkgname.png"
}
