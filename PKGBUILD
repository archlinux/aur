# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-awaitable
_pkgname=${pkgname//python-/}
pkgver=0.2.0
pkgrel=1
pkgdesc=" A decorator to asynchronously execute synchronous functions"
url="http://www.muflone.com/awaitable/"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('41b796cf37eac0e7a9a6c4790a5ab993d85f5740a39d27190036bac7c8482bcc')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

