# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-vcstool')
pkgver='0.2.14'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('6a0ab0bf95e4e2bcd1a814f8a4356b2ac7ffa1e57a39b6799f88adfc666785e5')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
