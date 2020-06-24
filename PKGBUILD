# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-vcstool')
pkgver='0.2.11'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('9cc0693e2726acba6dd46e9c3c8c471ddcde9fc506df169bd426d92450673aa4')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
