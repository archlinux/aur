# Maintainer: <mumei AT airmail DOT cc>
pkgname=drb-git
pkgver=r1
pkgrel=1
pkgdesc="Douay-Rheims Bible and other Catholic doctrinal texts, from your terminal"
arch=(any)
url="https://github.com/theunpleasantowl/drb"
license=('Public Domain')
depends=(bash)
source=('drb::git+https://github.com/theunpleasantowl/drb')
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
	install -Dm755 drb $pkgdir/usr/bin/drb
}
