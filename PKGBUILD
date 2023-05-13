# Maintainer: txelu

pkgname=dnglab-git
_pkgname=dnglab
pkgver=0.5.1
pkgrel=0
pkgdesc="A camera RAW to DNG file format converter."
arch=(any)
url="https://github.com/dnglab/dnglab"
license=(GPL2)
depends=()
makedepends=(git rust)

source=("git+https://github.com/dnglab/dnglab.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    git checkout tags/v$pkgver -b build-$pkgver
    cargo build --release
}

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin"
}