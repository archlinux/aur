# Maintainer: Sergey Desyatkov <sergeydesyatkov@proton.me>

pkgname=ls-x
pkgver=1.3.0
pkgrel=1
pkgdesc="Imagine ls command, but better"
arch=('x86_64')
url="https://github.com/desyatkoff/lsx"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04775d0782fdd5d470c05ff2aceed72c9fc471cc0e0c5464f075e5e7c3f81fb3')

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
