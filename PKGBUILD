# Maintainer: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname='python-pacparser'
pkgver=1.4.0
pkgrel=2
arch=(i686 x86_64)
url="https://github.com/manugarg/pacparser"
license=('LGPL')
depends=('python>=3.7')
options=('!makeflags')
pkgdesc="Python 3.x pacparser module"
source=("${url}/releases/download/v${pkgver}/pacparser-v${pkgver}.tar.gz")
sha256sums=('2e66c5fe635cd5dcb9bccca4aced925eca712632b81bada3b63682159c0f910e')

build() {
  cd "pacparser-v${pkgver}"
  PYTHON=python3 make all pymod -C src
}

package() {
  cd "pacparser-v${pkgver}"
  PYTHON=python3 make -C src DESTDIR="$pkgdir/" install-pymod
}

# vim:set ts=2 sw=2 et:
