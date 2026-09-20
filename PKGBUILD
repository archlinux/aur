pkgname=xget
pkgver=1.0.1
pkgrel=1
pkgdesc="A universal CLI downloader written in Rust"
arch=('x86_64')
url='https://github.com/denix666/xget'
license=('MIT')
depends=('bash-completion')
optdepends=(
    'zsh: zsh shell completions'
    'fish: fish shell completions'
)

source=("https://github.com/denix666/xget/releases/download/v${pkgver}/xget_linux_x86_64.tar.gz")

package() {
    install -Dm755 "${srcdir}/xget" "${pkgdir}/usr/bin/xget"

    "${srcdir}/xget" --completions bash |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/xget"

    "${srcdir}/xget" --completions zsh |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_xget"

    "${srcdir}/xget" --completions fish |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/xget.fish"
}
sha256sums=('0aa5a7155389e9c7c2cdf1a1f35097317a909cc7cbaa8d236237a0ce6deb7ab4')
