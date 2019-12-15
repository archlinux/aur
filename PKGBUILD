# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-rust
pkgver=0.2.1
pkgrel=1
pkgdesc="The new cmsMake! (this time in Rust)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/edomora97/task-maker-rust"
license=('MPL2')
makedepends=('cargo')
optdepends=('texlive-core: booklet compilations')
source=("https://github.com/edomora97/task-maker-rust/archive/v${pkgver}.tar.gz")
sha256sums=('2197e215f7cd0ec6ede9410e6631bd956c1bda338fbb9b720bb294ac4ae5aaf7')

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
