# Maintainer: Thomas 'Eternahl' ROLLIN
pkgname=cwonf
pkgver=0.4.1
pkgrel=1
url="https://codeberg.org/Eternahl/cwonf"
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Harmonize your system by synchronizing your configurations"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz"::$url/archive/$pkgver.tar.gz)
md5sums=("073283e7246ec6b0bf7ad8f2c093d050")

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
