# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: Sergio Tridente < tioduke (at) gmail (dot) com >
# Contributor: bb010g < bb010g (at) bb010g (dot) com >

pkgname=python2-http-ece
_pkgname=http_ece
pkgver=1.0.5
pkgrel=1
pkgdesc="Encrypted Content Encoding for HTTP (python2)"
arch=('any')
url="https://pypi.org/project/http-ece"
license=('MIT')
depends=(python2)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2f31a0640c31a0c2934ab1e37005dd9a559ae854a16304f9b839e062074106cc')


build() {
  cd "$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python2 ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
