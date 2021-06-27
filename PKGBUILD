# Maintainer: thacoon <thacoon@posteo.de>
pkgname=cpass
pkgver=0.0.2
pkgrel=1
pkgdesc="A terminal password manager written in Rust."
arch=("x86_64")
url="https://gitlab.com/thacoon/cpass.git"
license=('MIT')
depends=('rust' 'cargo' 'gcc-libs')
source=("git+https://gitlab.com/thacoon/cpass.git?ref=v$pkgver")
sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname
    cargo build --release
}

package() {
    cd $srcdir/$pkgname
    install -D -m755 target/release/$pkgname $pkgdir/usr/bin/$pkgname
}
