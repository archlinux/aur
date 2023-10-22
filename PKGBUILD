# Manteiner: Iván Villargasa <ivvil412@gmail.com>

pkgname=guile-hoot
pkgver=0.1.0
pkgrel=1
pkgdesc="A Spritely project which provides a full-featured WebAssembly (WASM) toolkit in Scheme"
arch=(any)
url="https://spritely.institute/hoot/"
license=('Apache')
depends=('guile-git')
source=("https://spritely.institute/files/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
        make check WASM_HOST=hoot
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
