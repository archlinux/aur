# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='python-dataclasses-json'
pkgname=('python-dataclasses-json')
_module='dataclasses-json'
pkgver='0.5.1'
pkgrel=1
pkgdesc='Easily serialize Python Data Classes to and from JSON'
url='https://github.com/lidatong/dataclasses-json'
depends=(
    'python'
    'python-marshmallow'
    'python-marshmallow-enum'
    'python-typing-inspect'
    'python-stringcase'
)
optdepends=()
makedepends=(
    'python-setuptools'
)
license=('MIT')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/d/dataclasses-json/dataclasses-json-0.5.1.tar.gz'
)
md5sums=('733be735be2558626e07062c3327744f')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd
}
