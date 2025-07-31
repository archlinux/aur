# Maintainer:  Vihaan Krishnan <opensourcecontributer@gmail.com>
# Contributor: Vihaan Krishnan <opensourcecontributer@gmail.com>
pkgname=nimra
pkgver=8
pkgrel=1
pkgdesc="A compiler written in rust"
arch=('any')
url="https://github.com/krisvih32/nimra"
license=('AGPL-3.0-or-later')
makedepends=('make' 'cargo' 'git' 'sudo')
depends=('glibc')
source=("git+https://github.com/krisvih32/nimra.git#branch=stable")
sha256sums=('SKIP')
build() {
    cd "$srcdir/nimra"
    cargo build --release --locked
}
package() {
    cd "$srcdir/nimra"
    sudo install -Dm755 $srcdir/target/release/nimra "/usr/bin/nimra"
    sudo install -Dm644 $srcdir/LICENSE "/usr/share/licenses/$pkgname/LICENSE"
}
