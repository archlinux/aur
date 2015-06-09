# Maintainer: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname='python-pacparser'
pkgver=1.3.1
pkgrel=2
arch=(i686 x86_64)
url="http://pacparser.googlecode.com"
license=('LGPL')
depends=('python')
options=('!makeflags')
pkgdesc="Python 3.x pacparser module"
source=("http://pacparser.googlecode.com/files/pacparser-${pkgver}.tar.gz")

build() {
  cd pacparser-$pkgver
  PYTHON=python3 make all pymod -C src
}

package() {

  cd pacparser-$pkgver
  PYTHON=python3 make -C src DESTDIR="$pkgdir/" install-pymod
}

# vim:set ts=2 sw=2 et:
sha512sums=('20295667d92eb5385429c085c14ca8dc1ba216487ff474304433f99119216934be2dd1647452173418de31f5345679dd7159eafd331e40a2b87564f878d31349')
