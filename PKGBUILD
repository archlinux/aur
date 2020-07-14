# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google
pkgver=3.0.0
pkgrel=1
pkgdesc='Google search from Python'
arch=('x86_64')
url='https://github.com/MarioVilas/googlesearch'
license=('BSD-3-Clause')
depends=(python python-beautifulsoup4)
optdepends=()
makedepends=(python python-setuptools)
source=("$pkgname-$pkgver::https://github.com/MarioVilas/googlesearch/archive/v$pkgver.tar.gz")
sha256sums=('9fd814876322b84f7f73499f3bd96b4da7533904e7f00c6dea2e262a467889d1')

_pkgname=googlesearch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
