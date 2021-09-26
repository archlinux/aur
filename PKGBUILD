
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vis-filetype-settings-git
_pkgname=${pkgname%-git}
pkgver=r8.60f8fa3
pkgrel=1
pkgdesc='A plugin for the vis editor that lets the user set options depending on filetype.'
arch=('any')
url='https://github.com/jocap/vis-filetype-settings'
license=('MIT')
depends=('vis')
provides=('vis-filetype-settings')
conflicts=('vis-filetype-settings')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "$_pkgname.lua" -t "$pkgdir/usr/share/vis/plugins"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
