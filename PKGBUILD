# Maintainer: Steven Allen <steven@stebalien.com>
# Contributer: Felix Yan <felixonmars@gmail.com>
# Contributor: Max Meyer <dev@fedux.org>

pkgname='python-pacparser'
pkgver=1.3.7
pkgrel=2
arch=(i686 x86_64)
url="https://github.com/pacparser/pacparser"
license=('LGPL')
depends=('python>=3.6')
options=('!makeflags')
pkgdesc="Python 3.x pacparser module"
source=("https://github.com/pacparser/pacparser/archive/${pkgver}.tar.gz")
sha256sums=('575c5d8096b4c842b2af852bbb8bcfde96170b28b49f33249dbe2057a8beea13')

build() {
  cd pacparser-$pkgver
  PYTHON=python3 make all pymod -C src
}

package() {

  cd pacparser-$pkgver
  PYTHON=python3 make -C src DESTDIR="$pkgdir/" install-pymod
}

# vim:set ts=2 sw=2 et:
