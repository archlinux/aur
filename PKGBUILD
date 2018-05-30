# Maintainer: CupIvan <mail@cupivan.ru>

pkgname=tinydns
pkgver=0.0.1
pkgrel=1

pkgdesc='Tiny cache DNS server'
arch=('x86_64' 'i686')
url=https://github.com/CupIvan/$pkgname

source=(https://github.com/CupIvan/$pkgname/archive/v$pkgver.tar.gz)

md5sums=('239864e269ee5d8e06fec15996a62560')

build() {
	cd ${srcdir}/$pkgname-$pkgver
	./compile
}

package() {
	cd ${srcdir}/$pkgname-$pkgver

	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
