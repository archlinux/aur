pkgname=paga
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal pager, alternative to more/less'
arch=('x86_64')
url='https://github.com/StudiCraft/paga'
license=('Apache-2.0')
makedepends=('cargo')
install=paga.install
source=("https://github.com/StudiCraft/paga/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d54f44cf80bf6961da2d425e2f5e7951cdef940196553352889bf98960d452c6')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/paga" "$pkgdir/usr/bin/paga"
}
