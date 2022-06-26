# Maintainer: Thomas 'Eternahl' ROLLIN
pkgname=cwonf
pkgver=0.3.0
pkgrel=1
url="https://codeberg.org/Eternahl/cwonf"
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Harmonize your system by synchronizing your configurations"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz"::$url/archive/$pkgver.tar.gz)
md5sums=("19551b5dd1eb50d6c8c6e1393a3f3593")

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
