# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust
pkgver=0.2.2
pkgrel=1
pkgdesc="The new cmsMake! (this time in Rust)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/edomora97/task-maker-rust"
license=('MPL2')
makedepends=('cargo')
optdepends=('texlive-core: booklet compilations')
source=("https://github.com/edomora97/task-maker-rust/archive/v${pkgver}.tar.gz")
sha256sums=('05b356311f8b349273e2650f8c230888d50b7383b50cda99f8c9ff5d645605d3')

build() {
    cd "$srcdir/task-maker-rust-${pkgver}"
    TM_DATA_DIR=/usr/share/task-maker-rust cargo build --release
}

package() {
    cd "$srcdir/task-maker-rust-${pkgver}"
    install -Dm755 "target/release/task-maker" "$pkgdir/usr/bin/task-maker-rust"
    install -dDm755 "$pkgdir/usr/share/task-maker-rust"
    cp -rT data "$pkgdir/usr/share/task-maker-rust"
}
