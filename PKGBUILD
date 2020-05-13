# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.0.3
pkgrel=2
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('8f70e1ceefb85ca79aa4e85ec647c605828596081be8d597854718a4dd740797')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
