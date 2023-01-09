# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_name=proto-plus
pkgname=python-$_name
pkgver=1.22.2
pkgrel=1
pkgdesc='A wrapper around protocol buffers.'
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
depends=('python' 'python-google-api-core' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('636fd5a4c31238c13097abda8b2dca214923ac6cc0045ba7ca6b371d1352ee340f67ebbf8c171236c46ffdd40682f07987b44ba40daef09b214b275badac3e40')

build() {
	cd $_name-$pkgver
	python setup.py build
}

package() {
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
