# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-vcstool')
pkgver='0.2.14'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python2' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('6a0ab0bf95e4e2bcd1a814f8a4356b2ac7ffa1e57a39b6799f88adfc666785e5')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
