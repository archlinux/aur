# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='python-dataclasses-json'
pkgname=('python-dataclasses-json')
_module='dataclasses-json'
pkgver='0.5.7'
pkgrel=1
pkgdesc='Easily serialize Python Data Classes to and from JSON'
url='https://github.com/lidatong/dataclasses-json'
depends=(
    'python'
    'python-marshmallow'
    'python-marshmallow-enum'
    'python-typing_inspect'
)
optdepends=()
makedepends=(
    'python-setuptools'
)
license=('MIT')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/d/dataclasses-json/dataclasses-json-0.5.7.tar.gz'
)
sha256sums=('c2c11bc8214fbf709ffc369d11446ff6945254a7f09128154a7620613d8fda90')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd
}
