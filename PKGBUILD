
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=pandoc-completion
pkgver=2.11
pkgrel=2
pkgdesc='Bash completion for pandoc.'
arch=('x86_64')
url='https://pandoc.org'
license=('GPL')
depends=('pandoc')
source=('pandoc-completion.hook')
sha256sums=('85b6319bf02d1c60a99cfe8ceba1e887d5ede3cc6774082abd8c67230b3f4c57')

package() {
	completion="$pkgdir/etc/bash_completion.d"

	cd "$srcdir"
	install -d "$completion"
	pandoc --bash-completion > "$completion/pandoc-completion.bash"
	install -Dm644 pandoc-completion.hook -t "$pkgdir/etc/pacman.d/hooks"
}
