# Maintainer: Victor Häggqvist <victor@snilius.com>

pkgname=xboomx-snilius
pkgver=0.7.5
pkgrel=1
pkgdesc="A wrapper for most common occurrences in dmenu"
url="https://github.com/victorhaggqvist/xboomx"
license=('GPL-2.0')
arch=('any')
depends=('python' 'python-sqlalchemy' 'dmenu')
makedepends=('python-setuptools')
provides=('xboomx')
conflicts=('xboomx')

source=(https://github.com/victorhaggqvist/xboomx/archive/v${pkgver}.zip)
sha512sums=('4e5c09f59c67351e2e08d093c7847b2efbca3f71cd73fd191410f56b9b4236b6910b4d5920dca61cdc0b64434a17f95d06ce08bd22160e9c9b9d2049b4d705e6')

build() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
