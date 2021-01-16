
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-base16-git
_pkgname=${pkgname%-*}
pkgver=r6.05dae61
pkgrel=2
pkgdesc='Themes for the vis editor.'
arch=('any')
url='https://github.com/pshevtsov/base16-vis'
license=('MIT')
depends=('vis')
provides=('vis-base16')
source=("$_pkgname::git+https://github.com/pshevtsov/base16-vis.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 themes/* -t "$pkgdir/usr/share/vis/themes"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
