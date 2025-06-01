pkgname=archtry
pkgver=1.0.3
pkgrel=1
arch=('x86_64' 'aarh64')
pkgdesc="Arch Linux Installation Simulator"
url="https://github.com/6z7y/archtry"
license=('GPL')
depends=('rust' 'make')
makedepends=('rust' 'make' 'git')
source=("git+https://github.com/6z7y56/archtry.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/archtry "$pkgdir/usr/bin/archtry"
}

clean() {
    cd "$srcdir/$pkgname"
    cargo clean
}
