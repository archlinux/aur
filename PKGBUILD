# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname='python-imgtool'
_name="imgtool"
pkgdesc="MCUboot's image signing and key management"
pkgver=2.0.0
pkgrel=1
arch=('any')
url='https://pypi.org/project/imgtool/'
license=('Apache')
depends=(
    'python>=3.6'
    'python-cryptography>=2.4.2'
    'python-intelhex>=2.2.1'
    'python-cbor2'
    'python-click'
)
#makedepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('7a541255e69eec1f12aa38dce1f1d4fe20d8212677c68a9b6ec634ca91a06612')
