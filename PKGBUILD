# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-vcstool')
pkgver='0.2.10'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('5740f6f40bab847d6a108eb29b6ef639d87ac86b9e6f321e52bd42adab4f745f')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
