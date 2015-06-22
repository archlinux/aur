# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <victor@snilius.com>

pkgname=giti
pkgver=0.2.1
pkgrel=1
pkgdesc="A python command line tool fetching getting .gitignore files"
url="https://github.com/victorhaggqvist/giti"
license=('MIT')
arch=('any')
depends=('python' 'python-requests')
makedepends=('python-setuptools')

source=(https://github.com/victorhaggqvist/giti/archive/v${pkgver}.zip)
sha512sums=('04a103603f17ec0d217fd949ae7706c03007f45eaf551636a4cf34f0d995d60b99f18d0755c5ff4f6a79583d7d96ad55f56286a24099a430bebd5ec59ddf06fd')

build() {
  cd "$srcdir/giti-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/giti-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
