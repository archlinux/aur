# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_name=proto-plus
pkgname=python-$_name
pkgver=1.22.1
pkgrel=1
pkgdesc='A wrapper around protocol buffers.'
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
depends=('python' 'python-google-api-core' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('50f32b085d979019adba0f1d7cf6d3ad5ad60e13d8c0b1e146e6ca7a87506af2f0ce8aaf212a97cf44d7b392e2d1204bb425224acc39654658d0d7505be0c9bb')

build() {
	cd $_name-$pkgver
	python setup.py build
}

package() {
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
