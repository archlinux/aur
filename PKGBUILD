# Maintainer: Corey Stephan <corey.stephan@marquette.edu>
pkgname=vul-git
pkgver=r1
pkgrel=1
pkgdesc="Latin Vulgate Bible in the terminal"
arch=(any)
url="https://github.com/LukeSmithxyz/vul"
license=('custom:Public Domain')
depends=(bash)
source=('vul::git+https://github.com/LukeSmithxyz/vul')
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
