# $Id$
# Maintainer:  Ionut Biru <ibiru@archlinux.org>
# Contributor: William Díaz <wdiaz@archlinux.us>

pkgname=libnice-git
pkgver=0.1.13.1
pkgrel=2
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams)"
arch=('i686' 'x86_64')
url="http://nice.freedesktop.org"
license=('LGPL')
depends=('glib2')
provides=('libnice')
conflicts=('libnice')
makedepends=('gstreamer' 'gstreamer0.10' 'gtk-doc' 'autoconf')
optdepends=('gstreamer' 'gstreamer0.10')
git_sha=2803a0b4b70af9684e05ef5ed3f0c2fbca4b6c93
source=(https://github.com/libnice/libnice/archive/$git_sha.tar.gz)
md5sums=('6512c08aef0a19e6790488430e100040')

build() {
  cd libnice-$git_sha
  ./autogen.sh --prefix=/usr --disable-static --enable-compile-warnings=no 
  make
}

package() {
  cd libnice-$git_sha
  make DESTDIR="$pkgdir" install
}
