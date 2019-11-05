# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>
pkgname=projfs
pkgver=0.1.1
pkgrel=2
pkgdesc='A FUSE filesystem doing projection of existing directory by a custom command'
url='https://github.com/renyuneyun/projfs'
license=('Apache')
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
}
