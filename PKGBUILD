# Maintainer: Joachim Klahr <klahr@r8.rs>
pkgname=quadrate
pkgver=0.4.4
pkgrel=1
pkgdesc="Stack-based programming language that compiles to native code via LLVM"
arch=('x86_64')
url="https://git.sr.ht/~klahr/quadrate"
license=('GPL-3.0-or-later')
depends=('llvm-libs' 'jansson' 'openssl')
makedepends=('meson' 'ninja' 'clang' 'llvm' 'git')
optdepends=(
    'readline: for quadrepl interactive shell'
    'python: for LSP server'
)
options=('!debug' '!lto')
_gittag=0.4.4
source=("$pkgname-$pkgver::git+https://git.sr.ht/~klahr/quadrate#tag=$_gittag")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make release
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
