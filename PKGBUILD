# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyocr"
_pkgname="pyocr"
pkgver="0.5.1"
pkgrel="1"
pkgdesc="A Python wrapper for OCR engines (Tesseract, Cuneiform, etc)"
url="https://github.com/jflesch/pyocr"
depends=('python')
makedepends=('python' 'python-setuptools' 'git')
license=('GPL3')
arch=('any')
changelog="ChangeLog"
source=("git+https://github.com/jflesch/${_pkgname}#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    make build
}

package() {
    cd ${srcdir}/${_pkgname}
    PIP_ARGS="--root=\"${pkgdir}\" --optimize=1" make install
}
