pkgname=paxman
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern and fast package manager for Arch-based systems"
arch=('x86_64')
url='https://github.com/denix666/pax'
license=('MIT')
provides=('pax')
conflicts=('pax')
optdepends=(
    'bash-completion: bash shell completions'
    'zsh: zsh shell completions'
    'fish: fish shell completions'
)

source=("https://github.com/denix666/pax/releases/download/v${pkgver}/pax_linux_x86_64.tar.gz")

package() {
    install -Dm755 "${srcdir}/pax" "${pkgdir}/usr/bin/pax"

    "${srcdir}/pax" --completions bash |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/pax"

    "${srcdir}/pax" --completions zsh |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_pax"

    "${srcdir}/pax" --completions fish |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/pax.fish"
}
sha256sums=('701b6eb8ad3bf602d9865279a9744b790fd70cd6bace23ad3265456c4ee13d19')
