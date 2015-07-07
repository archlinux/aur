# Maintainer: Maximilian Stein <theoddbird@posteo.org>
# Contributor: derrida <deleuzians@gmail.com>
# Contributor: gucong <gucong43216@gmail.com>
# Contributor: ackalker <a.c.kalker@gmail.com>

pkgname=lush2
pkgver=2.0.1
pkgrel=3
pkgdesc="An object-oriented programming language designed for researchers, experimenters, and engineers interested in large-scale numerical and graphic applications."
arch=('x86_64' 'i686')
url="http://lush.sourceforge.net"
license=('LGPL')
optdepends=('gsl' 'lapack' 'sdl' 'opencv' 'alsa-lib' 'libxft' 'texlive-core')
makedepends=()
options=('!libtool')
source=(http://downloads.sourceforge.net/lush/lush-$pkgver.tar.gz)
sha256sums=('93441ec72b2d1afa6247f2f93d0a05796cf0d96a212442aa4b75366c8775f30a')
build() {
  cd "$srcdir/lush-$pkgver"
  ./configure LIBS=-lz X_EXTRA_LIBS=-lfontconfig --prefix=/usr --with-x
}
package() {
  cd "$srcdir/lush-$pkgver"
  make DESTDIR="$pkgdir" install
}