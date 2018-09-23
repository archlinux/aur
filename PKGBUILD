# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-cqueues' 'lua51-cqueues' 'lua52-cqueues')
pkgver=20171014
pkgrel=1
arch=('x86_64')
url='http://25thandclement.com/~william/projects/cqueues.html'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wahern/cqueues/archive/rel-$pkgver.tar.gz")
md5sums=('d3912ad77724b223e24d1ba55e9a9293')

build() {
	cd "cqueues-rel-$pkgver"
	make prefix=/usr
}

package_lua-cqueues() {
	pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.3'

	cd "cqueues-rel-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install5.3
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-cqueues() {
	pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.1'

	cd "cqueues-rel-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install5.1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-cqueues() {
	pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.2'

	cd "cqueues-rel-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install5.2
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
