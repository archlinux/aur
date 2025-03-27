pkgname=wrdlist
pkgver=0.0.5
pkgrel=1
arch=('x86_64' 'aarh64')
pkgdesc="Lightweight Wordlists Generator"
url="https://github.com/6z7y56/wrdlist"
license=('MIT')
depends=('rust' 'make')
makedepends=('rust' 'make' 'git')
source=("git+https://github.com/6z7y56/wrdlist.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/wrdlist "$pkgdir/usr/bin/wrdlist"
}

clean() {
    cd "$srcdir/$pkgname"
    cargo clean
}

