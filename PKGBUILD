# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-vcstool'
pkgname=('python-vcstool')
_module='vcstool'
pkgver='0.2.1'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python' 'python-yaml')
conflicts=('python2-vcstool')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/52/94/66ad79501f1d06dbd1a583d82dfa3b23674e2d311e05348cee6039635f27/vcstool-0.2.1.tar.gz")
sha256sums=('edf24d8a949c73b3c82342f7a10f738537b8b5fefa83205a2c459d8265ddc9b4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
