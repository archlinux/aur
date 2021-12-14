# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=globalplatform
pkgver=7.1.0
_commit=3832300cc5ade0439c2757ead1cf04e0e946e903
pkgrel=2
pkgdesc="GlobalPlatform libraries"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'pcsclite' 'openssl')
makedepends=('cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('da5b1e46ac40221406e51ddf8f82ef4e')

build() {
  cd globalplatform-$_commit/globalplatform
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/globalplatform
  make DESTDIR=$pkgdir install
}
