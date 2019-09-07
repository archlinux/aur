# Maintainer: Tobias Beeh <qwertzuiop2@t-online.de>
pkgname=fishmarks-git
pkgver=r23.485f6b3
pkgrel=1
pkgdesc="Handles bookmarks in fish shell"
arch=('any')
url="https://github.com/techwizrd/fishmarks"
license=('Apache')
groups=()
depends=("fish")
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname-git}"
	DST="$pkgdir/$( pkg-config --variable confdir fish)"
	mkdir -p "$DST"
	install -Dm 644 "marks.fish" "$DST"
}
