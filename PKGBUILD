# Maintainer: Riccardo Berto <riccardobrt at gmail dot com>

pkgname=redis-graph
pkgver=1.99.4
pkgrel=1
pkgdesc="This project is a Redis module that implements a graph database."
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/RedisLabsModules/$pkgname"
license=('AGPL-3.0')
depends=('redis' 'cmake')
conflicts=('redis-graph-git')
source=("$url/archive/v1.99.4.tar.gz")
install=$pkgname.install
sha256sums=("SKIP")

build() {
	cd RedisGraph-$pkgver
	make $MAKEFLAGS
}

package() {
	cd RedisGraph-$pkgver
        install -D src/redisgraph.so $pkgdir/usr/lib/redis/redisgraph.so
        install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
