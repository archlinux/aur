# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgname=python-crcmod
pkgver=1.7
pkgrel=2
pkgdesc='Cyclic Redundancy Check (CRC) implementation in Python.'
arch=('any')
url=https://pypi.python.org/pypi/crcmod/
license=('MIT')
depends=('python')

source=("https://pypi.python.org/packages/source/c/crcmod/crcmod-${pkgver}.tar.gz")
sha256sums=('dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e')

build() {
  cd crcmod-$pkgver
  python setup.py build
}

package() {
  cd crcmod-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
