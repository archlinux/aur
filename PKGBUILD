# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=guile-opengl
pkgver=0.2.0
pkgrel=2
pkgdesc="OpenGL bindings for Guile Scheme"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guile-opengl/"
license=('LGPL-3.0-or-later')
depends=(guile)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/guile-opengl/guile-opengl-${pkgver/_/-}.tar.gz)
sha256sums=('b8f087ec28823d099fb842c3ba94104bb04fa9e708166487a471989e1c176c65')

build() {
  cd "$srcdir"/guile-opengl-${pkgver/_/-}/
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/guile-opengl-${pkgver/_/-}/
  make DESTDIR="$pkgdir" install
}
