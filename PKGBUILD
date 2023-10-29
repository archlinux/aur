# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.7.1
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/tldr-pages/$_pkgname"
license=('MIT')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('666b2042148d2b4f0aa2c6dfe5edb373d9ba78e27173026d4c9fb6ed6a576d5fefb17a34f96907f98faec6bac890a3a61f848830ed49c68c27138d6afa496c95')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
