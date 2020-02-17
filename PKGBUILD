# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-analyzer-bin
pkgver=20200217
_pkgver='2020-02-17'
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs. Binary build."
arch=('x86_64')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT' 'Apache')
provides=('rust-analyzer')
conflicts=('rust-analyzer' 'rust-analyzer-git' 'rust-analyzer-vscode-git')
source=("ra_lsp_server-$_pkgver::$url/releases/download/$_pkgver/ra_lsp_server-linux")
md5sums=('10da24fbd829488d31834ad1b5335a27')

pkgver() {
    echo ${_pkgver//-}
}

package() {
    cd "$srcdir"
    install -Dm 755 "ra_lsp_server-$_pkgver" "$pkgdir/usr/bin/ra_lsp_server"
}
