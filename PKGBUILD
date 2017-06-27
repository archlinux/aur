# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-wstool')
pkgname=('python-wstool')
_module='wstool'
pkgver='0.1.13'
pkgrel=3
pkgdesc="workspace multi-SCM commands"
url="http://wiki.ros.org/wstool"
depends=('python' 'python-vcstools' 'python-yaml')
conflicts=('python2-wstool')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/w/wstool/wstool-${pkgver}.tar.gz")
md5sums=('7e41a0e4f92389a6b4e115c80dd5cf10')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
