# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=python-qiling
_name=${pkgname#python-}
pkgver=1.1.3
pkgrel=1
pkgdesc="Advanced binary emulation framework"
url='https://qiling.io'
arch=('x86_64')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile' 'python-registry' 'python-keystone' 'python-pyelftools')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('cb7391d59f39da4e18198dd894f56d0e51aca4e0551d83ba91a64acdc3b30c90')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
	export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}
