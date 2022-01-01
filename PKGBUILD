# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tinyrpc
pkgname=python-${_pyname}
pkgver=1.1.3
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
md5sums=('0b758afa703546bfde37bdc65804d07b')
sha256sums=('ac1ef6a1e0df0d5ccbd488d185e92581ddfe81a703b2d2aa0f1ad1fd99700f31')
sha512sums=('9d46040b1b5ee942f7e085bd7727132eeaa813ba9fc40df77d7ac6a665f5fe6008266f4ac01cf5a4d4498f51005c5a10608c5478d4007fa7f4781257023faf5e')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
