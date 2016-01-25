# Maintainer: Anton Leontyev <scileont /at/ gmail.com>
pkgname=ramspeed
pkgver=2.6.0
pkgrel=1
pkgdesc='Open source utility to measure cache and memory performance'
arch=('i686' 'x86_64')
depends=('glibc')
license=('custom')
url='http://alasir.com/software/ramspeed/'
source=(http://www.alasir.com/software/ramspeed/$pkgname-$pkgver.tar.gz Makefile)
md5sums=('546394131a1467a8651e0b8a218970c0'
         '03ff681717c551b53a736e9e3c6ea786')

prepare() {
	cp Makefile $pkgname-$pkgver/
}

build() {
	cd $pkgname-$pkgver
	export CARCH
	make
}

package() {
	install -Dm755 $pkgname-$pkgver/ramspeed "$pkgdir"/usr/bin/ramspeed
	install -Dm644 $pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/ramspeed/LICENSE
}
