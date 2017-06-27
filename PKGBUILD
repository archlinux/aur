# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python2-wstool')
pkgname=('python2-wstool')
_module='wstool'
pkgver='0.1.13'
pkgrel=3
pkgdesc="workspace multi-SCM commands"
url="http://wiki.ros.org/wstool"
depends=('python2' 'python2-vcstools' 'python2-yaml')
conflicts=('python-wstool')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/w/wstool/wstool-${pkgver}.tar.gz")
md5sums=('7e41a0e4f92389a6b4e115c80dd5cf10')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
