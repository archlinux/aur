# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=turbodiary
pkgver=0.5.0
pkgrel=1
pkgdesc="Turbo Diary - A Personal Diary"
arch=('x86_64')
url="https://github.com/emvigo/turbodiary"
license=('APACHE')
depends=('openssl' 'pcre2')
makedepends=('pkgconf')
source=("https://github.com/emvigo/turbodiary/archive/$pkgver.tar.gz")
sha256sums=('15916a7734165f2935e44e01064abe533a93c092ddd8af9d63116b342b7b35e1')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
