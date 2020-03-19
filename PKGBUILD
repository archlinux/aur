# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-vcstool'
pkgname=('python2-vcstool')
_module='vcstool'
pkgver='0.2.7'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python2' 'python2-yaml')
conflicts=('python-vcstool')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('73b4f34e5cd14bfd52629216b70d3c411015f1c15bc9231b66a5401e56a508d7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
