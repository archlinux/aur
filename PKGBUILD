# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-pipsi
_name=pipsi
pkgver=0.9
pkgrel=1
pkgdesc='Wraps pip and virtualenv to install scripts'
arch=('any')
url='https://github.com/mitsuhiko/pipsi/'
license=('BSD')
depends=(python-virtualenv python-click python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('688b688cc8a7a76612c0d4d1839aaef98ece8382d4382b9d8b6f0caa65f0ed34')
