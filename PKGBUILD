
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-smart-backspace-git
_pkgname=${pkgname%-git}
pkgver=r2.ae165c1
pkgrel=1
pkgdesc='A plugin for simulating softtabstop in vis.'
arch=('any')
url='https://github.com/ingolemo/vis-smart-backspace'
license=('GPL3')
depends=('vis')
provides=('vis-smart-backspace')
conflicts=('vis-smart-backspace')
source=("git+https://github.com/ingolemo/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 'init.lua' -t "$pkgdir/usr/share/vis/plugins/$_pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
