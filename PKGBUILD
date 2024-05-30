# Maintainer: C.Grace <rubbermetal@yahoo.com>

pkgname=python-pptx
_pypiname=${pkgname}
pkgver=0.6.23
pkgrel=1
pkgdesc="A Python library for creating and updating PowerPoint (.pptx) files"
url="https://github.com/scanny/python-pptx"
arch=('any')
license=('MIT')
depends=('python' 'python-behave>=1.2.5' 'flake8>=2.0' 'python-lxml>=3.1.0' 'python-mock>=1.0.1'
        'python-pyparsing>=2.0.1' 'python-pillow>=3.3.2' 'python-pytest>=2.5' 'python-xlsxwriter>=0.5.7')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scanny/python-pptx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64e0546c0c4267f5362810b2cea4c8e4e44805522aded202fdcc5f9936d50363')

build() {
    cd "${_pypiname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

