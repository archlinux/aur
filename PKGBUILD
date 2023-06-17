# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='python-marshmallow-enum'
pkgname=('python-marshmallow-enum')
_module='marshmallow-enum'
pkgver='1.5.1'
pkgrel=5
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
sha256sums=('38e697e11f45a8e64b4a1e664000897c659b60aa57bfa18d44e226a9920b6e58')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    popd
}
