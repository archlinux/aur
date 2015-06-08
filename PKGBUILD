pkgname=python-autobahn
_pkgname=autobahn
pkgver=0.10.4
pkgrel=2
pkgdesc='WebSocket and WAMP for Twisted and Asyncio'
url='http://autobahn.ws/python/'
arch=('any')
license=('Apache')
depends=('python>=3.4' 'python-six' 'python-txaio')
optdepends=(
	'python-zope-interface: Autobahn/Twisted backend'
	'python-twisted: Autobahn/Twisted backend'
	'python-wsaccel: WebSocket acceleration'
	'python-ujson: JSON acceleration'
	'python-snappy: WebSocket compression'
	'python-lz4: WebSocket compression'
	'python-msgpack: WAMPv2 binary serialization support')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/a/autobahn/$_pkgname-$pkgver.tar.gz")
md5sums=('4ae22413ee9ba8f6692e80e171b68777')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}