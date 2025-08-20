
# Maintainer: Rubin Bhandari <roobin.bhandari@gmail.com>

pkgname=pokego-bin
pkgver=0.4.1
pkgrel=2
pkgdesc="command-line tool that lets you display Pokémon sprites in color directly in your terminal"
url="https://github.com/rubiin/pokego"
license=("GPL-3.0")
provides=("pokego")
arch=('x86_64' 'aarch64')
conflicts=("pokego" "pokego-git")
source=("https://github.com/rubiin/pokego/releases/download/v$pkgver/pokego_Linux_x86_64.tar.gz")
sha256sums=("SKIP")

prepare() {
  # Ensure a clean extraction
  rm -rf pokego_Linux_x86_64.tar.gz
  tar -xzf pokego_Linux_x86_64.tar.gz
}

package() {

    install -Dm755  pokego_Linux_x86_64/pokego -t "$pkgdir/usr/bin"
    install -Dm644  pokego_Linux_x86_64/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # install completions
    install -Dm644 completions/pokego.bash "$pkgdir/usr/share/bash-completion/completions/pokego"
    install -Dm644 completions/pokego.fish "$pkgdir/usr/share/fish/vendor_completions/pokego.fish"
    install -Dm644 completions/pokego.zsh "$pkgdir/usr/share/zsh/site-functions/_pokego"
}
