# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tinyrpc
pkgname=python-${_pyname}
pkgver=1.1.1
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
md5sums=('34d7b41ab48297b6b8fbf937e3d43a57')
sha256sums=('9e68d7b9688dac8deaa342a2507d04f0b2ece64a9d19382aa2ee13d692e87d7f')
sha512sums=('2ab7117d82d0dbebb1691917e0fb572dcb2327fd1dd4bed52f46491baa74b3181f7277cfc212fd0c8b53a9db276474d5d836e7bdb0383ac70339b0bd9fd535c2')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
