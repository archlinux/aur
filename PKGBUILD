# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.3.0
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/acuteenvy/$_pkgname"
license=('MIT')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('78066724d5a692a6fa55541c21640cee99073e9bd49667314a3700f450bea321406d2c75e7b5a4a557a69a546e86ee4b901b16eca43e2234a7160ad653202d6c')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
