# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=python-certvalidator
_name=${pkgname#python-}
pkgver=0.11.1
pkgrel=1
pkgdesc='Validates X.509 certificates and paths'
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python' 'python-asn1crypto' 'python-oscrypto')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('922d141c94393ab285ca34338e18dd4093e3ae330b1f278e96c837cb62cffaad')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
