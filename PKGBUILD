# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-vcstool')
pkgver='0.2.9'
pkgrel=2
pkgdesc='A version control system tool designed to make working with multiple repositories easier'
arch=('any')
url='https://github.com/dirk-thomas/vcstool'
license=('Apache')
depends=('python2' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-vcstool')
source=("https://github.com/dirk-thomas/vcstool/archive/${pkgver}.tar.gz")
sha256sums=('96f2d5d3953b012b434a803c1a9b849511aaf7eaa227994225ded209c4b23927')

_module='vcstool'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
