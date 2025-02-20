# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-aiohttp-sse-client
_pkgname=${pkgname:7}
pkgver=0.2.1
pkgrel=1
pkgdesc="A Server-Sent Event python client base on aiohttp"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
# makedepends=(python-build python-installer python-wheel python-pytest-runner) # upstream did not configure pytest plugins needed
depends=(python python-aiohttp python-attrs python-multidict python-yarl)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('5004e29271624af586158dc7166cb0687a7a5997aab5b808f4b53400e1b72e3b')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

