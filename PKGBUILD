# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-analyzer-bin
pkgver=20200127
_pkgver='2020-01-27'
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs. Binary build."
arch=('x86_64')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT' 'Apache')
provides=('rust-analyzer')
conflicts=('rust-analyzer' 'rust-analyzer-git' 'rust-analyzer-vscode-git')
source=("ra_lsp_server::$url/releases/download/$_pkgver/ra_lsp_server-linux")
md5sums=('7ee3e7ac47fc418c360a0c33a0ffc339')

pkgver() {
    echo ${_pkgver//-}
}

package() {
    cd "$srcdir"
    install -Dm 755 "ra_lsp_server" -t "$pkgdir/usr/bin/"
}
