# Maintainer: Thomas 'Eternahl' ROLLIN
pkgname=cwonf
pkgver=0.2.0
pkgrel=1
url="https://codeberg.org/Eternahl/cwonf"
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Harmonize your configurations"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz"::$url/archive/$pkgver.tar.gz)
md5sums=("899e20f55514d766c84e8104139e0f97")

build() {
    return 0
}

check() {
	cd "$pkgname"
	cargo test
}

package() {
    # cargo install --root="$pkgdir" cwonf
    cd $pkgname
    cargo build --release
    mkdir -p $pkgdir/usr/bin
    mv target/release/$pkgname $pkgdir/usr/bin
}
