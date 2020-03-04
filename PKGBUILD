# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-analyzer-bin
pkgver=20200302
_pkgver='2020-03-02'
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs. Binary build."
arch=('x86_64')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT' 'Apache')
provides=('rust-analyzer')
conflicts=('rust-analyzer' 'rust-analyzer-git' 'rust-analyzer-vscode-git')
source=("rust-analyzer-$_pkgver::$url/releases/download/$_pkgver/rust-analyzer-linux")
md5sums=('60388c3123f88e7e23c13b2db2cb1ba3')

pkgver() {
    echo ${_pkgver//-}
}

package() {
    cd "$srcdir"
    install -Dm 755 "rust-analyzer-$_pkgver" "$pkgdir/usr/bin/rust-analyzer"
}
