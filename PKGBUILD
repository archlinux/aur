# pandoc-completion

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=pandoc-completion
pkgver=2.11
pkgrel=1
pkgdesc='Bash completion for pandoc.'
arch=('x86_64')
url='https://pandoc.org'
license=('GPL')
depends=('pandoc')
source=('pandoc-completion.hook')
sha256sums=('85b6319bf02d1c60a99cfe8ceba1e887d5ede3cc6774082abd8c67230b3f4c57')

package() {
    completion="$pkgdir/etc/bash_completion.d"
    hooks="$pkgdir/etc/pacman.d/hooks"

    cd "$srcdir"
    install -dv "$completion"
    pandoc --bash-completion > "$completion/pandoc-completion.bash"
    install -Dvm644 pandoc-completion.hook "$hooks/pandoc-completion.hook"
}

