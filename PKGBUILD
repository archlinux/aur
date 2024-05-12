# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pptx
_pypiname=${pkgname}
pkgver=0.6.23
pkgrel=1
pkgdesc="Create Open XML PowerPoint documents in Python"
url="https://github.com/scanny/python-pptx"
arch=('any')
license=('MIT')
depends=('python' 'python-behave' 'flake8' 'python-lxml' 'python-mock'
	'python-pyparsing' 'python-pillow' 'python-pytest' 'python-xlsxwriter')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scanny/python-pptx/archive/v${pkgver}.tar.gz")
sha256sums=('64e0546c0c4267f5362810b2cea4c8e4e44805522aded202fdcc5f9936d50363')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
