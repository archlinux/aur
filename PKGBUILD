# Maintainer: John Smith <knobpersonal@gmail.com>
pkgname='menu-git'
pkgver=r27.a283e00
pkgrel=1
pkgdesc="A library for cli programs parsing text databases (git version)."
arch=('x86_64')
url="https://gitlab.com/KNIX3/menu"
license=('GPL')
depends=('tree')
makedepends=('git')
provides=('menu')
source=("$pkgname::git+https://gitlab.com/KNIX3/menu.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	install -Dm755 ./menu "$pkgdir/usr/bin/menu"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
