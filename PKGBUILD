# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=docopt-ng
pkgname=python-${_pkgname}
pkgver=0.8.1
pkgrel=1
pkgdesc="Jazzband-maintained fork of docopt, the humane command line arguments parser."
url="https://github.com/jazzband/docopt-ng"
depends=('python' 'python-regex')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ea6a61a288fc864eee6b22d6fe28aa202d59fc86fad05f16ff5e39cc4ea7f6e3')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
