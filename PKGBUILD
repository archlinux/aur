# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-osrf_pycommon'
pkgname=('python2-osrf_pycommon')
_module='osrf_pycommon'
pkgver='0.1.9'
pkgrel=1
pkgdesc="Commonly needed Python modules, used by Python software developed at OSRF"
url="http://osrf-pycommon.readthedocs.org/"
depends=('python2' 'python2-trollius')
provides=('python2-osrf-pycommon')
conflicts=('python2-osrf-pycommon')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a5f8861f86a2e8552748b1d552de1297d05d027d38bbf7e811b2107a85d75eeb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
