# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname='python-imgtool'
_name="imgtool"
pkgdesc="MCUboot's image signing and key management"
pkgver=2.1.0
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

sha256sums=('4f7fbcdf53c44eaaa6226504510ccb52f7ef00c997503cf94934b330c9607b60')
