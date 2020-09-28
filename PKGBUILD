# Maintainer: KokaKiwi <kokakiwi+git@kokakiwi.net>

_pkgname=mergedeep
pkgname="python-${_pkgname}"
pkgver=1.3.0
pkgrel=1
pkgdesc='A deep merge function for Python'
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('19a91123e71ae27cb22335f4d03aec040026c89d4ff6df42595f7e7223a83dfb')
b2sums=('a32cc93184bc81d95b69f102288ca901a784e2c6482215bdba20d71ed05516877e05f206d8a58521bb3e18ba754f81789270037d6a066cc4343f8480b52f2402')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
