# Maintainer: Pavel Sayekat; mail to <pavelsayekat@gmail.com>

pkgname=aspell-bn
pkgver=0.01.1
pkgrel=1
pkgdesc="Bengali spellcheck dictionary for aspell"
arch=('i686' 'x86_64')
url="http://aspell.net/"
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/bn/aspell6-bn-${pkgver}-1.tar.bz2")
sha256sums=('b03f9cc4feb00df9bfd697b032f4f4ae838ad5a6bb41db798eefc5639a1480d9')

build() {
  cd "${srcdir}/aspell6-bn-${pkgver}-1"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/aspell6-bn-${pkgver}-1"

  make DESTDIR="${pkgdir}" install
}
