pkgbase='python-oelint-parser'
pkgname=("${pkgbase}")
_module=${pkgbase/python-/}
pkgver='5.1.0'
pkgrel=1
pkgdesc='Alternative parser for bitbake recipes'
url='https://github.com/priv-kweihmann/oelint-parser'
depends=('python-deprecated' 'python-regex')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('548e58ae2be9be7b42dea0ff0435da53e70e0bb1bcd198eff55135bc3bec8da1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
