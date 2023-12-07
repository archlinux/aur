# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_name=proto-plus
pkgname=python-$_name
pkgver=1.23.0
pkgrel=1
pkgdesc='A wrapper around protocol buffers.'
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
depends=('python' 'python-google-api-core' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('1a30304e652ac5dab68f96574fc223036e0a3353151491c79ab35018a67a2901eafd6c8ebffe286ec52c8b02fb86c4534653643ff6e322cfea2d5999159fb283')

build() {
	cd $_name-$pkgver
	python setup.py build
}

package() {
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
