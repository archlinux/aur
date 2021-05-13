
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-fzf-open-git
_pkgname=${pkgname%-git}
pkgver=r17.b1666a3
pkgrel=1
pkgdesc='Use fzf to open files in vis.'
arch=('any')
url='https://git.sr.ht/~mcepl/vis-fzf-open'
license=('AGPL3')
depends=('vis' 'fzf')
provides=('vis-fzf-open')
conflicts=('vis-fzf-open')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 init.lua -t "$pkgdir/usr/share/vis/plugins/fzf-open"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
