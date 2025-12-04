# Maintainer: Sergey Desyatkov <sergeidesyatkov@gmail.com>

pkgname=ls-x
pkgver=1.0.0
pkgrel=1
pkgdesc="Imagine ls command, but better"
arch=('x86_64')
url="https://github.com/desyatkoff/lsx"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('124baa2aa5175d6146314de13b99914e4bf062514bb8c0e2a52e8d8e96396f31')

build() {
    cd "$srcdir/lsx-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/lsx-$pkgver"
    install -Dm755 "target/release/lsx" "$pkgdir/usr/bin/lsx"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lsx/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lsx/README.md"
}
