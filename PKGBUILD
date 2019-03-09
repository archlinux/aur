# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=python-puzpy
pkgver=0.2.3
pkgrel=1
pkgdesc="Python library for reading and writing .puz crossword files"
arch=('any')
url="https://github.com/alexdej/puzpy"
license=('MIT')
depends=('python')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('eee6af3cc1fd52aaff1eb804e47ff73c9794ed2aece6a2bf37a907cab52067aa249587b2afe9d61f94243ebabd05c2f6a2711f7e9a31df8d8c817f776efc17d0')

build() {
  cd "${pkgname/python-/}-$pkgver"

  python setup.py build
}

package() {
  cd "${pkgname/python-/}-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-puzpy/LICENSE
}
