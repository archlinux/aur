# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-tesserocr
pkgver=2.5.1
pkgrel=1
pkgdesc="A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython"
url="https://github.com/sirfz/tesserocr"
depends=(python leptonica tesseract)
makedepends=(python-setuptools)
license=(MIT)
arch=(x86_64)
source=("https://files.pythonhosted.org/packages/source/t/tesserocr/tesserocr-${pkgver}.tar.gz")
md5sums=('49d0701f97752dbbc1be708d559a24e6')

build() {
    cd "tesserocr-${pkgver}"
    python setup.py build
}

package() {
    cd "tesserocr-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
