# Maintainer: Sergey Desyatkov <sergeydesyatkov@proton.me>

pkgname=ls-x
pkgver=1.2.0
pkgrel=1
pkgdesc="Imagine ls command, but better"
arch=('x86_64')
url="https://github.com/desyatkoff/lsx"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f648864ed133d3e22ae0473850c8c2bb0ca726fcf98d7013583174c8c104d015')

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
