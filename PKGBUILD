# Maintainer: Maximilian Stein <theoddbird@posteo.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Hannes Rist <cowider@gmail.com>
# Contributor: ackalker <a.c.kalker@gmail.com>

pkgname=lush
pkgver=1.2.1
pkgrel=2
pkgdesc="An object-oriented programming language designed for researchers, experimenters, and engineers interested in large-scale numerical and graphic applications."
arch=('x86_64' 'i686')
url="http://lush.sourceforge.net"
license=('GPL')
optdepends=('gsl' 'lapack' 'sdl' 'opencv' 'alsa-lib' 'libxft')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1423085ef7c4ed83374333ba7a552e7f5f35add8db0c2478c8b00c96931ad8c9')
build() {
  cd "$srcdir/$pkgname"
  ./configure LIBS=-lz X_EXTRA_LIBS=-lfontconfig --prefix=/usr --with-x
}
package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir"/ install
}