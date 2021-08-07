# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=python-puzpy
pkgver=0.2.4
pkgrel=1
pkgdesc="Python library for reading and writing .puz crossword files"
arch=('any')
url="https://github.com/alexdej/puzpy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('a25322e4db892f7e77ece35bc43c2e3ab04bc13faacd3ffa3f89f92e0063b87369050a4a421d64efa10093c67b697451e404563041909e7a3a2e0f7e05a98f76')

build() {
  cd "${pkgname/python-/}-$pkgver"

  python setup.py build
}

package() {
  cd "${pkgname/python-/}-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-puzpy/LICENSE
}
