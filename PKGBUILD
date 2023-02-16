# Maintainer: peiyangxie <helloxpy@gmail.com>

_name=lac
pkgname=python-$_name
pkgver=2.1.2
pkgrel=1
arch=(any)
pkgdesc='A chinese lexical analysis tool by Baidu NLP'
url='https://github.com/baidu/lac'
depends=(paddlepaddle-bin)
makedepends=(python-setuptools)
license=(Apache)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name^^}-${pkgver}.tar.gz)
sha256sums=(22fcde0d5082d2044205ea6f6a7a9cd1f0d63e7b21b2dd5c9c73f27e7c0a3ef1)

build() {
    cd "${_name^^}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name^^}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

