pkgname=rlshim
pkgver=1.5.1
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite."
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'gcc-libs' 'glibc' 'java-runtime>=11')
makedepends=('cargo' 'make' 'pkgconf' 'curl')
provides=('rlshim')
conflicts=('rlshim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RdrSeraphim/rlshim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ed9923a26fdb02c34fe47b1621a5dde4403eb58a4585a24eb52f6ce462bedc2')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" PREFIX=/usr make install
}
