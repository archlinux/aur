# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.6.0
pkgrel=1
pkgdesc="Turbo Diary - A Personal Diary"
arch=('x86_64')
url="https://github.com/emvigo/turbodiary"
license=('APACHE')
depends=('openssl' 'pcre2')
makedepends=('pkgconf')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('96349057c748425356eafa78efcc9d42cf161aa002b5d20e163d9d0274610476')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
