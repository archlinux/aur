# Contributor: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname=python-pacparser
pkgver=1.5.4
pkgrel=1
pkgdesc='Python 3.x pacparser module'
arch=(i686 x86_64 aarch64)
license=(LGPL-3.0-only)
url=https://github.com/manugarg/pacparser
depends=('python>=3.8')
makedepends=(git python-setuptools)
options=(!makeflags)
source=(git+https://github.com/manugarg/pacparser.git#tag=v$pkgver)
sha256sums=('b1e2f0a10b81460a197b4805b4dc9e6abbd4b828c2a34963f7e75f0b5a5ec5e1')

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
