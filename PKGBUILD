# Maintainer: Sergey Desyatkov <sergeidesyatkov@gmail.com>

pkgname=ls-x
pkgver=1.1.0
pkgrel=1
pkgdesc="Imagine ls command, but better"
arch=('x86_64')
url="https://github.com/desyatkoff/lsx"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6844996bdba2d8990016daceff49948de6279637900a50e8f9204305dedd7ef')

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
