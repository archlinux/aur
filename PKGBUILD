# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <victor@snilius.com>

pkgname=giti
pkgver=0.2.2
pkgrel=1
pkgdesc="A python command line tool fetching getting .gitignore files"
url="https://github.com/victorhaggqvist/giti"
license=('MIT')
arch=('any')
depends=('python' 'python-requests')
makedepends=('python-setuptools')

source=(https://github.com/victorhaggqvist/giti/archive/v${pkgver}.zip)
sha512sums=('ff0974a500da64f332607ad743a0aef3ab098b25ad7ecf7f53449e2d352d79e2fd81913414a3807ecd843a536a2299a5c6138d9d5b9ec6f67a3893086033d864')

build() {
  cd "$srcdir/giti-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/giti-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
