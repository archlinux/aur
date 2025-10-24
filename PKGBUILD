# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=actual-server-runit
pkgver=20251024
pkgrel=1
pkgdesc="Runit service script for Actual Budget"
arch=("x86_64")
url="https://actualbudget.org/"
license=("MIT")
depends=("actual-server" "runit")
source=("actual-server.run" "actual-server.log.run")
sha256sums=('7c4e42d9e25370cd671ac08c5c25abf919829334fd48e8e1ab36b1fc1339280b'
            'f97551cadd8e6819aead5c6eebd5e4565c43a953b4afcb2de45f279b1b43c812')

package() {
	cd "$srcdir"
	install -Dm755 actual-server.run "$pkgdir/etc/runit/sv/actual-server/run"
	install -Dm755 actual-server.log.run "$pkgdir/etc/runit/sv/actual-server/log/run"
}
