# Contributor: Lex Black <autumn-wind@web.de>

_base=dj-config-url
pkgname=python-${_base}
pkgver=0.1.1
pkgrel=1
arch=(any)
pkgdesc="12factor inspired URLs to configure your Django Application (deprecated)"
url="https://github.com/julianwachholz/${_base}"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('a62d42eca302de5d4b762e72641e5e9c0548f104eca46a687a1dcb940d6dc5e6cd0d442d0c6ab57a0e43afdf5d6110ef28d3bcfaed4437a93c6cfdf57eb55477')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}
