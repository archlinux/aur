# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=deheader-git
pkgver=1.11.r18.g02f464e
pkgrel=1
pkgdesc="Find and remove unneeded includes in C/C++ sourcefiles"
arch=('any')
url="https://www.catb.org/~esr/deheader/"
license=('BSD-2-Clause')
depends=('python')
makedepends=('git' 'asciidoctor')
provides=("deheader=$pkgver")
conflicts=('deheader')
source=("git+https://gitlab.com/esr/deheader.git")
sha256sums=('SKIP')


pkgver() {
  cd "deheader"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "deheader"

  make
}

check() {
  cd "deheader"

  #make check
}

package() {
  cd "deheader"

  install -Dm755 "deheader" -t "$pkgdir/usr/bin"
  install -Dm644 "deheader.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/deheader"
}
