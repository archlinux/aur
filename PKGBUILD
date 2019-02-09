# Maintainer: emersion <contact at emersion dot fr>

pkgname=tooru-git
_pkgname=${pkgname%-git}
pkgver=r0.04a871a
pkgrel=2
pkgdesc="Archive and sync content you want to see twice"
arch=('any')
url="https://github.com/emersion/tooru"
license=('MIT')
groups=()
depends=('youtube-dl' 'wget')
makedepends=('git' 'make')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/emersion/tooru.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long --tags --all | cut -d - -f 2- | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
