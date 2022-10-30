# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>

pkgname=python-qiling
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=2
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('any')
license=('GPL2')
depends=('python'
		 'python-capstone'
		 'python-unicorn'
		 'python-pefile'
		 'python-registry'
		 'python-keystone'
		 'python-pyelftools'
		 'python-gevent'
		 'python-multiprocess'
		 'python-yaml')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('82d3d8c2643debe8f3e97aea534b9f68dec7b7a82aaedc46ac3a1a4d671eeff5')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim:set et sw=4 sts=4 tw=80:
