# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=globalplatform
pkgver=7.2.0
_commit=3a2240428891746fe404c7aecbf76599a4598fdf
pkgrel=1
pkgdesc="GlobalPlatform libraries"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'pcsclite' 'openssl')
makedepends=('cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('d91f9d1c9b7ef2c53834170308f93cfe')

build() {
  cd globalplatform-$_commit/globalplatform
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/globalplatform
  make DESTDIR=$pkgdir install
}
