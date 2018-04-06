# Maintainer: Håvard Pettersson <mail@haavard.me>

_pkgname=scrython
pkgname=python-scrython
pkgver=1.4.0
pkgrel=2
pkgdesc='A Python wrapper for the Scryfall.com API'
url='https://github.com/NandaScott/Scrython'
arch=(any)
license=(MIT)
depends=(python python-aiohttp)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1099e86ad950916609c3fdcc7f39062091e8a04ef22413fe59adff4c434e950a')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
