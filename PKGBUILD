pkgname=archtry
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="Arch Linux Installation Simulator"
url="https://github.com/6z7y56/archtry"
license=('MIT')
depends=('rust')
makedepends=('cargo' 'git')
source=("git+https://github.com/6z7y56/archtry.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/archtry "$pkgdir/usr/bin/wrdlist"
}

clean() {
    cd "$srcdir/$pkgname"
    cargo clean
}
