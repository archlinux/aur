# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=silentjack
pkgver=0.3
pkgrel=1
pkgdesc="SilentJack is a silence/dead air detector for the Jack Audio Connection Kit"
arch=('x86_64')
url="https://www.aelius.com/njh/silentjack/"
license=('GPL-2.0')
depends=('jack')
source=("https://www.aelius.com/njh/silentjack/silentjack-${pkgver}.tar.gz")
md5sums=('8bc921c5c4e1253a6c10f27eb2c45884')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR=$pkgdir make install
}