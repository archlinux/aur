# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=python-qiling
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('x86_64')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile' 'python-registry' 'python-keystone' 'python-pyelftools' 'python-gevent')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('826c6579b3b6bb687e245e141c98fa88488f48d86784fbfa3b3a9508690b8289')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
	export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}
