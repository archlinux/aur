# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=python-signify
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc='Module to generate and verify PE signatures'
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python' 'python-pyasn1' 'python-asn1crypto' 'python-oscrypto' 'python-certvalidator')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f00ecff9dd166f7216ea14598ec7c97bd3676ff2e99223b424d5cf8ee86c5fb9')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
