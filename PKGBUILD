# Maintainer: David Sultaniiazov <x1z53@корсаков.рус>

pkgname=korsakov-git
pkgver=1.22.1.2
pkgrel=1
pkgdesc='Cyrillic multi-paradigm general-purpose programming language'
url='https://gitverse.ru/rus.yaz/korsakov'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('fasm')
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  make install
}

pkgver() {
  cd $pkgname

  git describe --tags | sed 's|v\([^:]*\).*|\1|'
}
