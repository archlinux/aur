# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-wstool')
pkgver='0.1.18'
pkgrel=1
pkgdesc='Command-line tool for maintaining a workspace of projects from multiple version-control systems'
arch=('any')
url='https://github.com/vcstools/wstool'
license=('BSD')
depends=('python' 'python-vcstools' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-wstool')
source=("https://github.com/vcstools/wstool/archive/${pkgver}.tar.gz")
sha256sums=('f04621acda755a45896db2d3a84131f96cf69905515997637b4568f3fad5c46e')

_module='wstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
