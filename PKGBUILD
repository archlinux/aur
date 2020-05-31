# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-vcstools')
pkgver='0.1.42'
pkgrel=3
pkgdesc='Python library for interacting with various VCS systems'
arch=('any')
url='https://github.com/vcstools/vcstools'
license=('BSD')
depends=('python' 'python-dateutil' 'python-yaml')
makedepends=('python-setuptools')

conflicts=()
source=("https://github.com/vcstools/vcstools/archive/${pkgver}.tar.gz")
sha256sums=('3dccd4d3c82d3be6b0ba6a2def83af7e68ee495d108587ac66aa74720e5e9c97')

_module='vcstools'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
