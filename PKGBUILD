# Maintainer: cozisco <cozisco at gmail dot com>
pkgbase=python-salib
pkgname=('python-salib')
_pyname=SALib
pkgver=1.3.11
pkgrel=1
pkgdesc="Tools for sensitivity analysis. Contains Sobol, Morris, and FAST methods"
url="http://salib.github.io/SALib/"
arch=(any)
license=('MIT')
depende=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-pandas')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('af07e284ce1e85d2fea6c571b4b3d5c518f70faa518ed890ca4212bd0ad0d3d8')

build() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python setup.py build
}

package_python-salib() {
    depends=('python-numpy' 'python-matplotlib' 'python-scipy' 'python-pandas')
    
    cd "${srcdir}/${_pyname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-salib/LICENSE.txt"
}
