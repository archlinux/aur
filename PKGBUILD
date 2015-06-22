# Maintainer: Victor Häggqvist <victor@snilius.com>

pkgname=xboomx-snilius
pkgver=0.7.4
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
sha512sums=('5828568270eec6017346c5c6d9ed8d57e88392bb04a720f3858accd5a118441ab1ec63974a15559bd93ee6630ab694188397de4ad7bf71dc970791acd8b1ba02')

build() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/xboomx-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
