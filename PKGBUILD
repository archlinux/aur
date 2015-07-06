# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Jack <nim901 [at the] gmail [dot] com>

pkgname=('aspell-he')

pkgver=1.0
pkgrel=3
_pkgreview=0

pkgdesc="Hebrew dictionary for aspell"
url="http://aspell.net/"

arch=('any')
license=('GPL')

depends=('aspell>=0.60')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/he/aspell6-he-${pkgver}-${_pkgreview}.tar.bz2")
sha1sums=('cd6755053937b9c32995d7fa085cd269489f5484')


build() {
  cd ${srcdir}/aspell6-he-${pkgver}-${_pkgreview}
  ./configure
  make || exit 1  
}

package() {
  cd ${srcdir}/aspell6-he-${pkgver}-${_pkgreview}
  make DESTDIR=${pkgdir} install
}
