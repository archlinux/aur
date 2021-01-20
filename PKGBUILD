# Contributor: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-facebook-sdk
_pypiname=facebook-sdk
pkgver=3.1.0
pkgrel=1
pkgdesc="Python SDK for Facebook's Graph API "
arch=('any')
url="https://facebook-sdk.readthedocs.io/en/latest/"
license=('Apache')
depends=('python2')
makedepends=('python2')
source=("https://pypi.python.org/packages/source/f/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('f562687624fbcd5206f393ca7ecb50d3')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
