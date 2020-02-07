# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-vcstool'
pkgname=('python-vcstool')
_module='vcstool'
pkgver='0.2.6'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python' 'python-yaml')
conflicts=('python2-vcstool')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c5ae9f40d06b2c057d2e63c9e2a868213626a0d785c6ad69112314ca4704bf7e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
