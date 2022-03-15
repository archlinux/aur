# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=python-api4jenkins
pkgver=1.9
_name=${pkgname#python-}
pkgrel=1
pkgdesc="Python client library for Jenkins API"
arch=('any')
url="https://github.com/joelee2012/api4jenkins"
license=('Apache')
depends=('python-requests' 'python-certifi' 'python-charset-normalizer')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3166c3779662046e81fdd7180aed1db620ca0a386334b2b60f864c8bb90e5bf6')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
