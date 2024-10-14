pkgbase='python-oelint-parser'
pkgname=("${pkgbase}")
_module=${pkgbase/python-/}
pkgver='6.1.0'
pkgrel=1
pkgdesc='Alternative parser for bitbake recipes'
url='https://github.com/priv-kweihmann/oelint-parser'
depends=('python-deprecated' 'python-regex')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('89950ae5fc148438072825807bebcb83d6cf9ec13c78f6e9675cca1f394c9571')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
