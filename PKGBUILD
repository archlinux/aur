# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=python-signify
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Module to generate and verify PE signatures'
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python' 'python-pyasn1' 'python-asn1crypto' 'python-oscrypto' 'python-certvalidator')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f0bdbe8932e12f1b332ef7f5211681f780ca29812181d51aeb26db0892a75e39')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
