# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=(lua-cqueues lua51-cqueues lua52-cqueues)
pkgver=20161215
pkgrel=0
arch=('i686' 'x86_64')
url='http://25thandclement.com/~william/projects/cqueues.html'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
depends=('openssl')
source=('https://github.com/wahern/cqueues/archive/rel-20161215.tar.gz')
md5sums=('3e5bfb9ccb7fa8eea4f5d367dd0fe10a')
build() {
	cd cqueues-rel-20161215;
	make prefix=/usr
}

package_lua-cqueues() {
	pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.3'

	cd cqueues-rel-20161215;
	make DESTDIR=${pkgdir} prefix=/usr install5.3
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua51-cqueues() {
	pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.1'

	cd cqueues-rel-20161215;
	make DESTDIR=${pkgdir} prefix=/usr install5.1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-cqueues() {
	pkgdesc='Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua 5.2'

	cd cqueues-rel-20161215;
	make DESTDIR=${pkgdir} prefix=/usr install5.2
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
