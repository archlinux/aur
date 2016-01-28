# Maintainer: Sergei Jakovlev <sergei dot jakovlev dot 10 at gmail dot com>
pkgname=aspell-et
_distname=aspell6-et
pkgver=0.1.21_1
pkgrel=1
pkgdesc="Estonian dictionary for aspell."
url="http://aspell.net"
arch=('any')
license=('LGPL2.1')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/et/${_distname}-${pkgver//_/-}.tar.bz2")
md5sums=('82929f49ddc1149b6ef2bde4c3c12bcd')

build() {
  cd "${srcdir}/${_distname}-${pkgver//_/-}"
  
  ./configure
  make
}

package() {
  cd "${srcdir}/${_distname}-${pkgver//_/-}"
  
  make DESTDIR="${pkgdir}" install
}
