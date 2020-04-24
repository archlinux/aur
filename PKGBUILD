# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.8.0
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://github.com/emvigo/turbodiary'
license=('APACHE')
depends=('openssl' 'pcre2')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('b9fe7dc22911605c352524b790fa6107962552be5d550a3a4669b56cb56b328b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
