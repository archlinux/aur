# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=wasabi
pkgname=python-${_pkgname}
pkgver=0.8.2
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b4a36aaa9ca3a151f0c558f269d442afbb3526f0160fd541acd8a0d5e5712054')

build() {
	cd "wasabi-${pkgver}"
	python setup.py build
}

package() {
	cd "wasabi-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
