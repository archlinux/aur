# Contributor: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname=python-pacparser
pkgver=1.4.2
pkgrel=1
pkgdesc='Python 3.x pacparser module'
arch=(i686 x86_64 aarch64)
license=(LGPL)
url=https://github.com/manugarg/pacparser
depends=('python>=3.7')
makedepends=(git)
options=(!makeflags)
_tag=0bf0636de624996fe202b51eec8a58abd774269e
source=(git+https://github.com/manugarg/pacparser.git#tag=$_tag)
sha256sums=(SKIP)

pkgver() {
  cd pacparser
  git describe --tags | sed 's/^v//'
}

build() {
  cd pacparser
  make all pymod -C src
}

package() {
  cd pacparser
  make -C src DESTDIR="$pkgdir/" install-pymod
}

# vim:set ts=2 sw=2 et:
