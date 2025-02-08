# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.10.0
pkgrel=1
pkgdesc="Official tldr client written in Rust"
arch=('x86_64')
url="https://github.com/tldr-pages/$_pkgname"
license=('MIT')
depends=('gcc-libs')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('02fca0553d8ef5299b77220e6e11b38fc02ed61cf9dbde49b84f28a7c547efd2792819ea9b3099d5d96d5175306822f6098245f55b629ebbd5f796cee04a54d4')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
