# Maintainer:  Vihaan Krishnan <opensourcecontributer@gmail.com>
# Contributor: Vihaan Krishnan <opensourcecontributer@gmail.com>
pkgname=nimra
pkgver=6
pkgrel=1
pkgdesc="A compiler written in rust"
arch=('any')
url="https://github.com/krisvih32/nimra"
license=('AGPL-3.0-or-later')
makedepends=('make' 'cargo' 'git' 'sudo')
depends=('libgcc_s.so=1-64' 'ld-linux-x86-64.so=2-64' 'libc.so=6-64')
source=("git+https://github.com/krisvih32/nimra.git#branch=stable")
sha256sums=('SKIP')
build() {
    cd "$srcdir/nimra"
    cargo build --release --locked
}
package() {
    cd "$srcdir/nimra"
    sudo install -Dm755 $srcdir/../target/release/nimra "/usr/bin/nimra"
    sudo install -Dm644 $srcdir/../LICENSE "/usr/share/licenses/$pkgname/LICENSE"
}