# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.1.0
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('25e2fc319ec6df317d766ea2f23b41c95514d8192423394576b3595cec976cff')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir" PREFIX='/usr' install
}
