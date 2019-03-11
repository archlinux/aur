# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords
pkgver=1.0.3
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python' 'python-blessed' 'python-puzpy')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('d599fca05fc4ca61ef06f5c5ab743cb72eebfc1831bc88f108289cba513eba69b6e9b889b9d520ee195714d06c033b9e39c15a5d40ab7bf19a6cba3ee5b0bfc3')

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="$pkgdir"
}
