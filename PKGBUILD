# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=glucose
pkgver=4.0
pkgrel=1
pkgdesc="Parallel SAT solver based on Minisat, with glue clauses."
arch=('i686' 'x86_64')
url="http://www.labri.fr/perso/lsimon/glucose/"
license=('MIT')
depends=('gcc-libs' 'zlib')
# sigh, no versions
source=("http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup.tgz")
md5sums=('b6f040a6c28f011f3be994663338f548')

build() {
  export MROOT="$srcdir/$pkgname"
  cd "$srcdir/glucose-syrup/parallel"
  make r
}

package() {
  cd "$srcdir/glucose-syrup/parallel"
  install -Dm755 glucose-syrup_release "$pkgdir/usr/bin/glucose"
  install -Dm644 ../LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}

# vim:set ts=2 sw=2 et:
