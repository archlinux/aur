
# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>

pkgname=pokego-bin
pkgver=0.5.2
pkgrel=2
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal"
url="https://github.com/rubiin/pokego"
license=("GPL-3.0")
provides=("pokego")
arch=('x86_64' 'aarch64')
conflicts=("pokego" "pokego-git")
depends=()
makedepends=()
sha256sums=('SKIP')

# Use a single source array with conditional selection
source=("https://github.com/rubiin/pokego/releases/download/v$pkgver/pokego_Linux_${CARCH}.tar.gz")

build() {
    tar xzf "pokego_Linux_${CARCH}.tar.gz"
}

package() {

    install -Dm755 pokego "$pkgdir/usr/bin/pokego"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install completions
    install -Dm644 completions/pokego.bash "$pkgdir/usr/share/bash-completion/completions/pokego"
    install -Dm644 completions/pokego.fish "$pkgdir/usr/share/fish/vendor_completions/pokego.fish"
    install -Dm644 completions/pokego.zsh "$pkgdir/usr/share/zsh/site-functions/_pokego"
}
