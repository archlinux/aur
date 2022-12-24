# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-bin
pkgver=1.1.4
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
sha256sums=("6b1db7e2475e27f53801c65bbf1b0b8ac856c95178975686f12631d51cc0f35c")

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
