# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.2.0
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('5d679eeac1a1652b12afc5e773a6ab5e0bc8960170f44db28113ab728ee89738')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make DESTDIR="$pkgdir" PREFIX='/usr' install
}
