# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=gpshell
pkgver=2.2.0
pkgrel=1
_commit=3a2240428891746fe404c7aecbf76599a4598fdf
pkgdesc="gpshell GlobalPlatform command shell"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
makedepends=('pandoc' 'cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('d91f9d1c9b7ef2c53834170308f93cfe')

build() {
  cd globalplatform-$_commit/gpshell
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gpshell
  make DESTDIR=$pkgdir install
}
