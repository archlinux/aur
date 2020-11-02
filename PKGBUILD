# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='python-marshmallow-enum'
pkgname=('python-marshmallow-enum')
_module='marshmallow-enum'
pkgver='1.5.1'
pkgrel=2
pkgdesc='Enum handling for Marshmallow'
url='https://github.com/justanr/marshmallow_enum'
depends=(
    'python'
    'python-marshmallow'
)
optdepends=()
makedepends=(
    'python-setuptools'
)
license=('MIT')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/m/marshmallow-enum/marshmallow-enum-1.5.1.tar.gz'
)
md5sums=('7f4624f5b553c50895c33b5195108c10')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd
}
