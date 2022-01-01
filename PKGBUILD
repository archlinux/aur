# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-aiozmq
pkgver=0.9.0
pkgrel=1
pkgdesc="asyncio support for ZeroMQ"
license=('BSD')
arch=('any')
url="https://github.com/aio-libs/aiozmq"
depends=('python-pyzmq' 'python-msgpack')
makedepends=('python-setuptools')
changelog=CHANGES.txt
install=aiozmq.install
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/aiozmq/aiozmq-$pkgver.tar.gz")
sha256sums=('9d7315bb77e2655fc3a5051ea22e79527d62c42e51b2420c4f6f3dcebae65230')

build() {
	cd "aiozmq-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "aiozmq-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
