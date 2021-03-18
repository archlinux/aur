# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tinyrpc
pkgname=python-${_pyname}
pkgver=1.0.4
pkgrel=1
pkgdesc="A small, modular, transport and protocol neutral RPC library that, among other things, supports JSON-RPC and zmq."
arch=(any)
url="https://github.com/mbr/tinyrpc"
license=(MIT)
depends=(
	python
	python-six
	python-gevent
	python-requests
	python-msgpack
	python-gevent-websocket
	python-websocket-client
	python-werkzeug
	python-pyzmq
)
makedepends=(
	python-setuptools
)
options=(!emptydirs)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('cd61e3cbc01ea940abc97d3a87abf4a7')
sha256sums=('4b41fab967fb1c978f573bf0d609a3b12cc3b6ed62bd3108f43f575563746396')
sha512sums=('a9f0f6e5c51a842e4a8cbf1843b52c4b2839e5874de42bf6c175f009fea582944ba6733f203c8d4aef979696fc11b165b1029cc89faf0a6298bc95ebaa0ca34b')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
