# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-vcstool')
pkgname=('python-vcstool')
_module='vcstool'
pkgver='0.1.37'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python' 'python-yaml')
conflicts=('python2-vcstool')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/v/vcstool/vcstool-${pkgver}.tar.gz")
md5sums=('9a1cd48707624744a42a3f9071d1b397')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
