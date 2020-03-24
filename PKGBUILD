# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=1.0
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://github.com/emvigo/minitimer'
license=('APACHE')
depends=('ncurses')
makedepends=('pkgconf')
source=("https://github.com/emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('8f09ff5b8477b97d17525efdde65aac65ef0f9b87660003065b54fc907824c7b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
