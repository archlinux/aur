pkgname=rlshim
pkgver=1.5.0
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
sha256sums=('66f7368e11b619f3e9b058dc78b31e7e4a4c2d743dd610c9f2d1991967882811')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" PREFIX=/usr make install
}
