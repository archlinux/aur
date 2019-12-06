# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.5.1
pkgrel=1
pkgdesc="Turbo Diary - A Personal Diary"
arch=('x86_64')
url="https://github.com/emvigo/turbodiary"
license=('APACHE')
depends=('openssl' 'pcre2')
makedepends=('pkgconf')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('94e3c371c1045817f6e746d41067ae54e8006c43cf2b848dd678954e3b561d1d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
