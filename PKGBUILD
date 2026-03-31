# Maintainer: Lena Pastwa <aur@lnps.me>
pkgname=tlrc-bin
_pkgname=tlrc
pkgver=1.13.0
pkgrel=1
pkgdesc="Official tldr client written in Rust"
arch=('x86_64')
url="https://github.com/tldr-pages/$_pkgname"
license=('MIT')
depends=('gcc-libs')
provides=('tldr')
conflicts=('tldr')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('6094ad1471b94552670fc45ec783b90fd4a8c02ab76af56bf116b9116618b44884c422121d01e14f9e843a9ed2d6403f98bb8252753f78a59e140b7801660806')

package() {
    install -Dm755 tldr -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 completions/tldr.bash "$pkgdir/usr/share/bash-completion/completions/tldr"
    install -Dm644 completions/_tldr -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/tldr.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
