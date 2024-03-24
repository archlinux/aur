# Maintainer: acuteenvy
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.9.0
pkgrel=1
pkgdesc="Official tldr client written in Rust"
arch=('x86_64')
url="https://github.com/tldr-pages/$_pkgname"
license=('MIT')
depends=('gcc-libs')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('e882f0a34aa6453def99d427bdda614a2378ed4691ffffe6f3153e1d969b5eecabaa298bac02f778bf64b79117cfc46f7824470cefd9bb6048bf2ecc62910b10')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
