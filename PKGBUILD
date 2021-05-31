# Maintainer: <mumei AT airmail DOT cc>
pkgname=gnustep-gui
pkgver=0.29.0
pkgrel=1
pkgdesc="The GNUstep GUI class library"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('LGPL')
depends=('gcc-libs' 'libjpeg' 'libtiff')
makedepends=('gcc-objc' 'gnustep-base' 'gnustep-make')
optdepends=('aspell' 'audiofile' 'flite1: required for speech synthesis' 'giflib' 'libcups' 'libsndfile' 'libao')
conflicts=('gnustep-gui-svn')
groups=('gnustep-core')
options=('!makeflags')
source=(https://github.com/gnustep/libs-gui/releases/download/gui-${pkgver//./_}/gnustep-gui-$pkgver.tar.gz)
sha256sums=('7bf12b29b12a2886003d3b251e8076ad284f41780c7322531676fcd54e1d6df5')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  ./configure --prefix=/usr --sysconfdir=/etc/GNUstep
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
