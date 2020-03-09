# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.7.0
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://github.com/emvigo/turbodiary'
license=('APACHE')
depends=('openssl' 'pcre2')
makedepends=('pkgconf')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('a0ee6f08da1eb879171764f07d51c784c81b68fee4f9c65d48cb9d1329e8a3f1')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
