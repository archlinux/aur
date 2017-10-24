# Maintainer: hauzer <hauzer.nv@gmail.com>

_pkgname=lfm
_pypipkgname=${_pkgname}h
pkgname=python-${_pkgname}
pkgver=1.1.1
pkgrel=1
pkgdesc='A Last.fm API interface.'
arch=('any')
url='https://gitlab.com/hauzer/lfm/'
license=('GPL')
depends=('python3' 'python-requests')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/${_pypipkgname::1}/${_pypipkgname}/${_pypipkgname}-${pkgver}.zip"
)
sha512sums=(
  '7d9eac7e8c3569b57bb653dbd528793d55e401dff226caa2685305946b2c365614658ea75254bde4e584344cb6beaf4dd1d72d6abaff811da8a6a6c4d623af96'
)

package() {
  cd "${srcdir}/${_pypipkgname}-${pkgver}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
