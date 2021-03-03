# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords
pkgver=1.0.4
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python' 'python-blessed' 'python-puzpy')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('45975dd4af34e8f50d8fd51d6d1b1890e0b8bf9edd9213589f6d64ba79c4b9e7b9ac8d41602e8b6d1f014e4b793224ff0b266885da14b3c6ad5531495a89a98b')

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --prefix=/usr --root="$pkgdir"
}
