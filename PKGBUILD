# Maintainer: envolution
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=guile-opengl
pkgver=0.2.0
pkgrel=3
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
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
