# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.7.1
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://github.com/emvigo/turbodiary'
license=('APACHE')
depends=('openssl' 'pcre2')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('0a80811d49069925bf74c21ce2e409a292004d4a4c6ae1460a6cce4b637f75ae')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
