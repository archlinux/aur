# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-vcstool')
pkgver='0.2.13'
pkgrel=1
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python2' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('6363747d1ae17747ddb8a0ee448e344439adbfed968fa8bebc1acac817ea162a')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
