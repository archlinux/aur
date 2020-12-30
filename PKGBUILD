
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-spellcheck-git
_pkgname=${pkgname%-git}
pkgver=r53.cc24d18
pkgrel=1
pkgdesc='Spellcheck plugin for the vis editor.'
arch=('any')
url='https://github.com/fischerling/vis-spellcheck'
license=('MIT')
depends=('vis')
provides=('vis-spellcheck')
conflicts=('vis-spellcheck')
source=("git+https://github.com/fischerling/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 'spellcheck.lua' -t "$pkgdir/usr/share/vis/plugins"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'Readme.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
