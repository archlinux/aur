# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-vcstool'
pkgname=('python2-vcstool')
_module='vcstool'
pkgver='0.2.3'
pkgrel=1
pkgdesc="vcstool provides a command line tool to invoke vcs commands on multiple repositories."
url="https://github.com/dirk-thomas/vcstool"
depends=('python2' 'python2-yaml')
conflicts=('python-vcstool')
makedepends=('python2-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/40/85/bdd3582a26b6da992eddee9688aea69799c7b06f1a58568065bb15e5e0a1/vcstool-0.2.3.tar.gz")
sha256sums=('dffa38be6c5995f5366ecc54a196a574e495afc83f69e8bfb9196097ae04a7d7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
