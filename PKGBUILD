# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=python-api4jenkins
pkgver=1.11
_name=${pkgname#python-}
pkgrel=1
pkgdesc="Python client library for Jenkins API"
arch=('any')
url="https://github.com/joelee2012/api4jenkins"
license=('Apache')
depends=('python-requests' 'python-certifi' 'python-charset-normalizer')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('10c6a8303df981e3d81fbe293c0f08bbda202061bae259bae756e34e73a17e7b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
