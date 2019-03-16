# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-vcstool'
pkgname=('python-vcstool')
_module='vcstool'
pkgver='0.1.40'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python' 'python-yaml')
conflicts=('python2-vcstool')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/be/ae/08ae71f2da950bf966ffa9829fdb43495e600a7b15c8c3ed4e6e4bf86412/vcstool-0.1.40.tar.gz")
md5sums=('506deebcc3e07467fdb95fa4c5ca122f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
