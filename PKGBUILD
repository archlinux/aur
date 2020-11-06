# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-vcstool')
pkgver='0.2.15'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('3592b59f30a886c48cf220cd1c8f4664f3628f29cd0a385e5351f4dcc69bdb7c')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
