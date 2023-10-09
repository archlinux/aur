# Maintainer: Milkii Brewster (aur [a] milkmiruku [dot] com)
pkgname=mpv-last-fm-scrobbler-git
pkgver=r7.5a2d39d
pkgrel=1
epoch=
pkgdesc="last.fm scrobbler for mpv"
arch=('any')
url="https://github.com/l29ah/mpv-plugins/tree/master/last.fm-scrobbler"
license=('unknown')
groups=()
depends=('mpv')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="echo.install"
changelog=
source=("mpv-last-fm-scrobbler-git::git+https://github.com/l29ah/mpv-plugins")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd $pkgname
	( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"/last.fm-scrobbler/
	install -D -m644 lastfm.lua "${pkgdir}/usr/share/mpv/scripts/lastfm.lua" 
	install -D -m644 lastfm.pl "${pkgdir}/usr/bin/lastfm.pl"
}
