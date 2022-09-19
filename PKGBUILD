# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=tinyrpc
pkgname=python-${_pyname}
pkgver=1.1.5
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
md5sums=('e9e8f35a7b862d63b9f8907a0eecbbff')
sha256sums=('da437a84448d0d55f55ad1f6f7ac1636474f5f56c372c02f60f3faa0f90d91b9')
sha512sums=('885aa07c67aca8071c48f2f3922fbfd59ca085651883dc791ca219afaea28eea76bdb514ba3ef113bbd5fb08c86c7b471518a3c8db0d6ffb05538586b0d97350')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
