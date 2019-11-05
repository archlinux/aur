# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>
pkgname=projfs
pkgver=0.1.1
pkgrel=1
depends=('fuse2')
makedepends=('rust' 'cargo')
arch=('x86_64')
source=("git+https://github.com/renyuneyun/projfs.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    binname=proj_fs
    install -Dm755 "target/release/$binname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
