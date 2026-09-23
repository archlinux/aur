pkgname=xget
pkgver=1.0.2
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
sha256sums=('4aed4bbc74291a2d047367ca5d08a940b4eb6d1e8b6196a38e48ab33ca6f2955')
