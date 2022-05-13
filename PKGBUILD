# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs')
optdepends=('libxcb: X11 clipboard support'
            'wl-clipboard: Wayland clipboard support')
provides=('didyoumean')
conflicts=('didyoumean')
source=("https://github.com/hisbaan/didyoumean/releases/download/v${pkgver}/dym-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=("e7d922dcc93843efa0b92cb8df988ea7935c80f1734ded253c6a0a3ed434e45f")

package() {
    cd "$srcdir/"

    install -Dm755 dym -t "${pkgdir}/usr/bin/"

    #  Install readme
    install -Dm644 docs/README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"

    # Install man page
    install -Dm644 man/dym.1 -t "${pkgdir}/usr/share/man/man1/"

    # Install shell completions
    install -Dm644 completions/dym.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
    install -Dm644 completions/dym.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
    install -Dm644 completions/_dym -t "${pkgdir}/usr/share/zsh/site-functions/"
}
