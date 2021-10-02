# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor : Repentinus <arch at repentinus dot eu>
# Contributor : Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-simplekml
pkgver=1.3.6
pkgrel=1
pkgdesc="KML generation helpers"
arch=('any')
url="https://simplekml.readthedocs.io/en/latest/"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/simplekml/simplekml-$pkgver.tar.gz")
sha256sums=('cda687be2754395fcab664e908ebf589facd41e8436d233d2be37a69efb1c536')

build() {
	cd "simplekml-$pkgver"
	python setup.py build
}

package() {
	cd "simplekml-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
