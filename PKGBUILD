# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=lightwrite
pkgver=0.1.0
pkgrel=2
pkgdesc="Lightwrite is a simple sdl2 based text-editor."
arch=('x86_64')
url="https://github.com/tim-tm/lightwrite"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver::https://github.com/tim-tm/lightwrite/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e55b75a1046288ff7648fd097c908bcea4e3bcc1941ca349df9e6a8a0a77682a68a6cc9c8443b156cede81d6f7b83e861ac2684cf58f6de6963b4324e2c7adf5')

build() {
	cd "$pkgname-$pkgver"
    ./configure
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
