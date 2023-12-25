# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>

pkgname=python-qiling
_name=${pkgname#python-}
pkgver=1.4.6
pkgrel=1
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
sha256sums=('97759006526273895709ee59d459a8c5aa8e6e513bb80696da01bf9d39fce0a7')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim:set et sw=4 sts=4 tw=80:
