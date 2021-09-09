# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

_name=bce-python-sdk
pkgname=python-baidubce
pkgver=0.8.62
pkgrel=1
pkgdesc="BCE SDK for python"
url="https://pypi.org/project/bce-python-sdk/"
depends=('python-pycryptodome' 'python-future' 'python-six')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('66bea585e683fb660f3474bd9e27303d345420d06470e7ebbd7df12bef5c3f59')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
