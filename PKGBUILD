# Maintainer: Thami Memel <memelthami@gmail.com>

pkgname=python-bottle-websocket
pkgver="v0.2.9"
pkgrel=1
pkgdesc='Adds websocket capabilities to bottle, leveraging gevent-websocket and gevent.'
url='https://github.com/zeekay/bottle-websocket'
arch=('any')
license=('MIT')
depends=('python-bottle' 'python-gevent' 'python-gevent-websocket')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeekay/bottle-websocket/archive/${pkgver}.tar.gz")
sha512sums=('e57ffcee8d1bf0f75ebe9e5c4679ebe63d4ab3da31556f217e3849084ae3a69fb5bc05a978484dee7dd8d6822c0d4cff2c68b494d7ad7b075bd0accde2aa4c1a')

build() {
	cd bottle-websocket-${pkgver//v/}
    python setup.py build
}

package() {
	cd bottle-websocket-${pkgver//v/}
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

}

# vim:set ts=2 sw=2 et:
