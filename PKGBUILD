# Maintainer: Petko Bordjukov <bordjukov@gmail.com>

pkgname=aspell-bg
_distname=aspell6-bg
pkgver=4.1_0
pkgrel=2
pkgdesc="Bulgarian dictionary for aspell"
arch=('i686' 'x86_64')
url="http://bgoffice.sourceforge.net/aspell/"
license=('GPL2')
depends=('aspell')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/bg/$_distname-${pkgver//_/-}.tar.bz2)
sha256sums=('74570005dc2be5a244436fa2b46a5f612be84c6843f881f0cb1e4c775f658aaa')

build() {
  cd "${srcdir}"/${_distname}-${pkgver//_/-}
  ./configure
  make
}

package() {
  cd "${srcdir}"/${_distname}-${pkgver//_/-}
  make DESTDIR="${pkgdir}" install
}
