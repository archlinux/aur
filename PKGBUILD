# Maintainer: Sergio Tridente < tioduke (at) gmail (dot) com >
# Contributor: bb010g < bb010g (at) bb010g (dot) com >

pkgname=python-http-ece
_pkgname=http_ece
pkgver=1.1.0
pkgrel=1
pkgdesc="Encrypted Content Encoding for HTTP"
arch=('any')
url="https://pypi.org/project/http-ece"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('932ebc2fa7c216954c320a188ae9c1f04d01e67bec9cdce1bfbc912813b0b4f8')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
