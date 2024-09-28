pkgbase='python-oelint-parser'
pkgname=("${pkgbase}")
_module=${pkgbase/python-/}
pkgver='5.0.0'
pkgrel=1
pkgdesc='Alternative parser for bitbake recipes'
url='https://github.com/priv-kweihmann/oelint-parser'
depends=('python-deprecated' 'python-regex')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cd3c9d7508169d940493c663f0fae290ec3df98f673d0378111f0843e0b55cc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
