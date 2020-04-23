# Maintainer: Petr Šťastný <aur@soptik.tech>
pkgname=desed
pkgver=1.1.4
pkgrel=1
pkgdesc="Debugger for sed, written in rust. Step through code and observe sed inner state."
arch=('x86_64')
url="https://github.com/soptikha2/desed"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('desed')
source=("$pkgname::git+https://github.com/soptikha2/desed.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    # Checkout to published version
    git checkout 'tags/v1.1.4'
    cargo build --release
}

package() {
    cd "$pkgname"

    install -D "target/release/desed" -t "$pkgdir/usr/bin"
}
