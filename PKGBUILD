# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google
pkgver=2.0.3
pkgrel=1
pkgdesc='Google search from Python'
arch=('x86_64')
url='https://github.com/MarioVilas/googlesearch'
license=('BSD-3-Clause')
depends=(python python-beautifulsoup4)
optdepends=()
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://github.com/MarioVilas/googlesearch/archive/v$pkgver.tar.gz")
sha256sums=('2103fcddb3ca60b2b1f52087d51d8e6f969e0ccdc5e67ee3c724011b3c99816d')

_pkgname=googlesearch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
