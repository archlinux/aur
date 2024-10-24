# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=lightwrite
pkgver=0.1.0
pkgrel=3
pkgdesc="Little text editor made with SDL2 in C."
arch=('x86_64')
url="https://github.com/tim-tm/lightwrite"
license=('MIT')
depends=('glibc' 'sdl2' 'sdl2_ttf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tim-tm/lightwrite/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9bcea027bd7f64d19d1d8115fc96564bf3f2c80970c61e603ad5c4175e4273a')

build() {
	cd "$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
