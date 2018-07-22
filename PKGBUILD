# Maintainer: Sergio Tridente < tioduke (at) gmail (dot) com >
# Contributor: bb010g < bb010g (at) bb010g (dot) com >

pkgname=python-http-ece
_pkgname=http_ece
pkgver=1.0.5
pkgrel=2
pkgdesc="Encrypted Content Encoding for HTTP"
arch=('any')
url="https://pypi.org/project/http-ece"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2f31a0640c31a0c2934ab1e37005dd9a559ae854a16304f9b839e062074106cc')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
