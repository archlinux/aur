# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs-git
pkgver=r2.864bdf1
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64')
url="http://tavianator.com/cgit/bfs.git/"
license=('custom:WTFPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('bfs::git+git://tavianator.com/bfs.git')
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 bfs "${pkgdir}/usr/bin/bfs"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}
