# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

## Cython compile does not work for some reason

pkgname=python-pulsar
pkgver=2.0.2
pkgrel=1
pkgdesc='Event driven concurrent framework'
arch=('any')
url='https://github.com/quantmind/pulsar'
license=('BSD')
depends=('python-multidict')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pulsar/pulsar-$pkgver.tar.gz")
sha256sums=('8120782a4daaeaf9717f800d901895a8d131ecfef8f26f5141416b640f9e31d3')

build() {
	cd "pulsar-$pkgver"
	python setup.py build
}

package() {
	cd "pulsar-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
