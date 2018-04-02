# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=python-scrython-git
pkgver=1.3.0.19.g22f7e17
pkgrel=1
pkgdesc='A Python wrapper for the Scryfall.com API'
url='https://addisonlynch.github.io/iexfinance/'
arch=(any)
license=(MIT)
depends=(python python-aiohttp)
makedepends=(python-setuptools)
conflicts=(python-scrython)
source=("$pkgname::git+https://github.com/NandaScott/Scrython.git")
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/-/./g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
