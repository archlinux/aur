# Maintainer: Philipp A. <flying-sheep@web.de>

_name=pubchempy
pkgname=python-pubchempy
pkgver=1.0.5
pkgrel=1
pkgdesc='A simple Python wrapper around the PubChem PUG REST API.'
arch=(any)
url="https://github.com/mcs07/$_name"
license=(MIT)
depends=(python)
optdepends=(python-pandas)
makedepends=(python-setuptools python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('08f0b2a82a5caa5d61e14935d655da554602d7b5686fe661ab584c882ffff623')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
