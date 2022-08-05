# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=gpshell
pkgver=2.3.0
pkgrel=1
_commit=e690b51b0f346fbdcd916b795433ca9da4a3b12f
pkgdesc="gpshell GlobalPlatform command shell"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
makedepends=('pandoc' 'cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('6eb114f27959686b06968bdfa9f1a07d')

build() {
  cd globalplatform-$_commit/gpshell
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gpshell
  make DESTDIR=$pkgdir install
}
