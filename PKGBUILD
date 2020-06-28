# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros. Written in Rust."
url="https://gitlab.com/ykkzde/random-case"
license=('GPL3')
provides=('random-case')
conflicts=('random-case-bin')
depends=(
    gcc-libs
)
makedepends=(
    rust
    cargo
)
source=("random-case-git-$pkgver-$pkgrel::git+$url.git")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('SKIP')

arch=('x86_64')

build() {
    cd random-case-git-$pkgver-$pkgrel
    cargo build --release
}

package() {
    cd "$srcdir/random-case-git-$pkgver-$pkgrel"

    # Install Binary
    install -Dm755 "./target/release/random-case" "$pkgdir/usr/bin/random-case"
}
