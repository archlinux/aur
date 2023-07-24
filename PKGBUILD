# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.5.0
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/acuteenvy/$_pkgname"
license=('MIT')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('e1b44ead20544266f90a4beff9acae4d968cee1afb640d86a3e0a51dfaae466829ac95e92a0b8dce5a9a7d0e4327ad7f0d6100ab05e3da3cbb0ebe5235dfd1dd')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
