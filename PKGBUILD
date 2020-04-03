# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.7.2
pkgrel=1
pkgdesc='Turbo Diary - A Personal Diary'
arch=('x86_64')
url='https://github.com/emvigo/turbodiary'
license=('APACHE')
depends=('openssl' 'pcre2')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('571f5fd9809770c763e760c4bb802dfa78c2564b84aac758487b2823e602c8bc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
