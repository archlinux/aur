# Contributor: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname=python-pacparser
pkgver=1.5.1
pkgrel=1
pkgdesc='Python 3.x pacparser module'
arch=(i686 x86_64 aarch64)
license=(LGPL-3.0-only)
url=https://github.com/manugarg/pacparser
depends=('python>=3.8')
makedepends=(git python-setuptools)
options=(!makeflags)
_tag=a0403120052c54be83504c680f716cfda5f399e5
source=(git+https://github.com/manugarg/pacparser.git#tag=$_tag)
sha256sums=('b8ee20f6d1d08348c052b0e396e1917b04c5dcf8071faf9b197024b80b21dcbe')

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
