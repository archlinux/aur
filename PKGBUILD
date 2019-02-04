# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=bison-epita
realpkgname="bison-3.2.1.52-cd4f7"
pkgver=3.99
pkgrel=2
pkgdesc="The GNU general-purpose parser generator (Tiger compiler version)"
arch=('x86_64')
license=('GPL3')
url="http://www.gnu.org/software/bison/bison.html"
depends=('glibc' 'm4' 'sh')
groups=('base-devel')
source=("https://www.lrde.epita.fr/~tiger/download/${realpkgname}.tar.gz")
md5sums=('32be135f6f3a8925d88702eb54661856')
#provides=('bison')
#conflicts=('bison')

build() {
  cd "${srcdir}/${realpkgname}"

  ./configure --prefix=/opt/bison-epita --datadir=/opt/bison-epita/share
  make
}

check() {
  cd "${srcdir}/${realpkgname}"
#  make -j1 check
}

package() {
  cd "${srcdir}/${realpkgname}"
  make DESTDIR="${pkgdir}" install
}
