# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# PRs: https://github.com/brokenpip3/my-pkgbuilds

pkgname=python-api4jenkins
pkgver=1.14.1
_name=${pkgname#python-}
pkgrel=1
pkgdesc="Python client library for Jenkins API"
arch=('any')
url="https://github.com/joelee2012/api4jenkins"
license=('Apache')
depends=('python-requests' 'python-certifi' 'python-charset-normalizer')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('109be785e2e08cb73781835e181e9847148ecac42edcbeec7ca619b0563ae36e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
