
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-toggler-git
_pkgname=${pkgname%-git}
pkgver=r2.16da718
pkgrel=1
pkgdesc='Improved versions of <C-a>, <C-x>, ~, g~, gu, and gU.'
arch=('any')
url='https://repo.or.cz/vis-toggler.git'
license=('unknown')
depends=('vis')
provides=('vis-toggler')
conflicts=('vis-toggler')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 init.lua -t "$pkgdir/usr/share/vis/plugins/vis-toggler"
	install -Dm644 example.lua -t "$pkgdir/usr/share/vis/plugins/vis-toggler"
}
