# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgbase='python-krpc'
_pyname='krpc'
pkgname=('python-krpc')
pkgver=0.5.4
pkgrel=1
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=("LGPL3")
arch=('any')
makedepends=(python-build python-installer python-wheel python-setuptools python-protobuf)
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/krpc-python-$pkgver.zip")
b2sums=("4edda54f2e76efa46ac29f2f5f1d6ed524680e4fae1adc9e35d820de2c2b6b3d70717ad5866ba3f6a905752004edd5e83f0ed1296ed7734d2f1be53363684bb0")

build() {
	cd $_pyname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pyname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
