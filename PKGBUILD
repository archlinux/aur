# Maintainer: Milkii Brewster (aur [a] milkmiruku [dot] com)
pkgname=mpv-last-fm-scrobbler-git
pkgver=r9.43178a4
pkgrel=1
epoch=
pkgdesc="last.fm scrobbler for mpv"
arch=('any')
url="https://github.com/Feqzz/mpv-lastfm-scrobbler"
license=('MIT')
groups=()
depends=('mpv' 'scrobbler')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="echo.install"
changelog=
source=("mpv-last-fm-scrobbler-git::git+https://github.com/Feqzz/mpv-lastfm-scrobbler")
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
	cd "$pkgname"
	install -D -m644 lastfm.lua "${pkgdir}/usr/share/mpv/scripts/lastfm.lua" 
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
