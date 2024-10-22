
# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>

pkgname=pokego-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal"
url="https://github.com/rubiin/pokego"
license=("GPL-3.0")
arch=("any")
provides=("pokego")
conflicts=("pokego" "pokego-git")
source=("https://github.com/rubiin/pokego/releases/download/v$pkgver/pokego-linux-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
    install -Dm755 pokego -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # install completions
    install -Dm644 completions/pokego.bash "$pkgdir/usr/share/bash-completion/completions/pokego"
    install -Dm644 completions/pokego.fish "$pkgdir/usr/share/fish/vendor_completions/pokego.fish"
    install -Dm644 completions/pokego.zsh "$pkgdir/usr/share/zsh/site-functions/_pokego"
}
