# Maintainer: Thomas 'Eternahl' ROLLIN
pkgname=cwonf
pkgver=0.1.2
pkgrel=1
url="https://codeberg.org/Eternahl/cwonf"
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Harmonize your configurations"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz"::$url/archive/$pkgver.tar.gz)
md5sums=("0d459467b3311b95359af79a62dca744")

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
