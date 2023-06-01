# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-bin
pkgver=1.8.2
pkgrel=1
pkgdesc='A command line time tracking application'
arch=('x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
provides=('tiempo')
conflicts=('tiempo')
source=("https://gitlab.com/api/v4/projects/27545092/packages/generic/v1.8.2/v1.8.2/tiempo-v${pkgver}-x86_64.tar.gz")
sha256sums=('cc73bf15b349861d1870bffa785336d48256c539622b604ff8ce1df54a1e57cd')

package() {
    cd "$srcdir/build"
    install -Dm755 bin/t "$pkgdir"/usr/bin/t

    install -Dm644 share/doc/tiempo/README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 share/doc/tiempo/LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 share/doc/tiempo/CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
    install -Dm644 share/man/man1/tiempo.1.gz "$pkgdir"/usr/share/man/man1/tiempo.1.gz
    install -Dm644 share/bash-completion/completions/t "$pkgdir"/usr/share/bash-completion/completions/t
    install -Dm644 share/fish/vendor_completions.d/t.fish "$pkgdir"/usr/share/fish/vendor_completions.d/t.fish
    install -Dm644 share/zsh/site-functions/_t "$pkgdir"/usr/share/zsh/site-functions/_t

    ln -s "$pkgdir"/usr/share/man/man1/tiempo.1.gz "$pkgdir"/usr/share/man/man1/t.1.gz
}

