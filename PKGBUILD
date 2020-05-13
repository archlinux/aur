# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.8.1
pkgrel=2
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/turbodiary'
license=('APACHE')
depends=('openssl' 'pcre2')
source=("https://git.sr.ht/~emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('2b629b1058014224aee787d55dde4d2d4a4f02028d153ab4bb57cd4da9dd8a79')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
