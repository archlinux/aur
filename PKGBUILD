# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname='python-imgtool'
_name="imgtool"
pkgdesc="MCUboot's image signing and key management"
pkgver=1.9.0
pkgrel=1
arch=('any')
url='https://pypi.org/project/imgtool/'
license=('Apache')
depends=('python>=3.6'
         'python-cryptography>=2.6'
         'python-intelhex'
         'python-click>=1.0.0')
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

sha256sums=('7fa7f6bd6bf069b5ffa07ea47478e16b6206bd2fc5b7607def999de0e9134a43')
