# Maintainer: <mumei AT airmail DOT cc>
pkgname=vul-complete-git
pkgver=r1.1
pkgrel=1
pkgdesc="Latin Clementine Vulgate Bible in the terminal"
arch=(any)
url="https://github.com/theunpleasantowl/vul-complete"
license=('Public Domain')
depends=(bash)
source=('vul-complete::git+https://github.com/theunpleasantowl/vul-complete')
md5sums=('SKIP')

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
	install -Dm755 vul $pkgdir/usr/bin/vul
}
