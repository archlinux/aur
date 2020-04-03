# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=1.0.1
pkgrel=2
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://github.com/emvigo/minitimer'
license=('APACHE')
depends=('ncurses')
source=("https://github.com/emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('ac91803f465a2f64e3a79c859e8d62fbd2ffac7ab2f63365fcb26ee291abca58')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
