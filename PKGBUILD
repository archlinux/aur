# Maintainer: Beethoven <beethovenisadog@protonmail.com>
pkgname=grg-git
pkgver=v1.0.0
pkgrel=2
pkgdesc="grg - a TUI for git repos"
url="https://codeberg.org/dogbold/grg"
license=('MIT')
depends=('bash' 'bat')
provides=('grg')
makedepends=('git')
optdepends=('ranger: compatible file manager'
						'joshuto: compatible file manager'
						'neovim: you want a text editor of some kind for this')
source=("git+https://codeberg.org/dogbold/grg.git")
md5sums=('SKIP')
arch=('any')

pkgver() {
	cd "$srcdir/grg"
	echo "v1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/grg"
	install -Dm755 grg "$pkgdir/usr/bin/grg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/grg/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/grg/README.md"
}
