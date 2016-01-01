# Maintainer: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname='python-pacparser'
pkgver=1.3.6
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/pacparser/pacparser"
license=('LGPL')
depends=('python')
options=('!makeflags')
pkgdesc="Python 3.x pacparser module"
source=("https://github.com/pacparser/pacparser/archive/${pkgver}.tar.gz")
sha256sums=('c1f6f2ccd4fec329175f882102e47c57328e8e6e16aa9dbd4f8b859f9a028e83')

build() {
  cd pacparser-$pkgver
  PYTHON=python3 make all pymod -C src
}

package() {

  cd pacparser-$pkgver
  PYTHON=python3 make -C src DESTDIR="$pkgdir/" install-pymod
}

# vim:set ts=2 sw=2 et:
