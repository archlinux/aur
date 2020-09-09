# pandoc-completion

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=pandoc-completion
pkgver=2.10.1
pkgrel=1
pkgdesc='Bash completion for pandoc.'
arch=('x86_64')
url='https://pandoc.org'
license=('GPL')
depends=('pandoc')
source=('pandoc-completion.hook')
sha256sums=('6f6ca34a91dbf61c74dd1c4ac335ac0c654009536391ee005dd3fea0370afee0')

package() {
    completion="$pkgdir/etc/bash_completion.d"
    hooks="$pkgdir/etc/pacman.d/hooks"

    cd "$srcdir"
    install -dv "$completion"
    pandoc --bash-completion > "$completion/pandoc-completion.bash"
    install -Dvm644 pandoc-completion.hook "$hooks/pandoc-completion.hook"
}

