# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=python-signify
_name=${pkgname#python-}
pkgver=0.5.2
pkgrel=1
pkgdesc='Module to generate and verify PE signatures'
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python'
         'python-pyasn1'
         'python-asn1crypto'
         'python-oscrypto'
         'python-certvalidator'
         'python-pyasn1-modules')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3480623a51ff544f59d703adb6e88558b227ecbddec8ac5204306ee86bebef4a')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
