# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pptx
_pypiname=${pkgname}
pkgver=0.6.22
pkgrel=1
pkgdesc="Create Open XML PowerPoint documents in Python"
url="https://github.com/scanny/python-pptx"
arch=('any')
license=('MIT')
depends=('python' 'python-behave' 'flake8' 'python-lxml' 'python-mock'
	'python-pyparsing' 'python-pillow' 'python-pytest' 'python-xlsxwriter')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scanny/python-pptx/archive/v${pkgver}.tar.gz")
sha256sums=('b3d79362c0349c0f0ada7dd95574cf53983239c269272dab2ba3ad3a67601d4c')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
