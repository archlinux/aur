# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.0.2
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://github.com/emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://github.com/emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('afd3bea56df3b4d6a16d905e128323f51237ba27677d5539b6864a411390a163')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
}
