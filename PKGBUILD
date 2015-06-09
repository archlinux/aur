# Maintainer: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname='python-pacparser'
pkgver=1.3.1
pkgrel=2
arch=(i686 x86_64)
url="https://github.com/pacparser/pacparser"
license=('LGPL')
depends=('python')
options=('!makeflags')
pkgdesc="Python 3.x pacparser module"
source=("https://github.com/pacparser/pacparser/archive/${pkgver}.tar.gz")
sha256sums=('d8a6f50d9697c7a40d7dbe180be3a7685390b1a80e537bd5b7c6215ec80c41c3')

build() {
  cd pacparser-$pkgver
  PYTHON=python3 make all pymod -C src
}

package() {

  cd pacparser-$pkgver
  PYTHON=python3 make -C src DESTDIR="$pkgdir/" install-pymod
}

# vim:set ts=2 sw=2 et:
