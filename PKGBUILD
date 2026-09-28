pkgname=paxman
pkgver=0.2.1
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
sha256sums=('10a6cf11204690bae68693d455f0a702fe25abc6960f2f8892d2644f7fd514d5')
