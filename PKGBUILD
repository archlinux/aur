# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Guenther Starnberger <gst@sysfrog.org>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=gpshell
pkgver=2.4.0
pkgrel=1
_commit=8d7587c78a8dac444491eb260edfe542359fb397
pkgdesc="gpshell GlobalPlatform command shell"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/kaoh/globalplatform"
depends=('glibc' 'globalplatform')
makedepends=('pandoc' 'cmake')
source=(https://github.com/kaoh/globalplatform/archive/$_commit.zip)
md5sums=('d0c14024fb74203e42ad51e5660f11be')

build() {
  cd globalplatform-$_commit/gpshell
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd globalplatform-$_commit/gpshell
  make DESTDIR=$pkgdir install
}
