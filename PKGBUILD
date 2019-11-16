# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-osrf_pycommon'
pkgname=('python-osrf_pycommon')
_module='osrf_pycommon'
pkgver='0.1.8'
pkgrel=2
pkgdesc="Commonly needed Python modules, used by Python software developed at OSRF"
url="http://osrf-pycommon.readthedocs.org/"
depends=('python')
provides=('python-osrf-pycommon')
conflicts=('python-osrf-pycommon')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a2441228c8fa08ab7750de6d49e34684bcd6e25be912b807c33377a9487f8a61')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
