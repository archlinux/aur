# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Sergio Tridente < tioduke (at) gmail (dot) com >
# Contributor: bb010g < bb010g (at) bb010g (dot) com >

pkgname=python-http-ece
_pkgname=http_ece
pkgver=1.2.1
pkgrel=1
pkgdesc="Encrypted Content Encoding for HTTP"
arch=('any')
url="https://pypi.org/project/http-ece"
license=('MIT')
depends=(python python-cryptography)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8c6ab23116bbf6affda894acfd5f2ca0fb8facbcbb72121c11c75c33e7ce8cff')


build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
