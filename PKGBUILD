# Maintainer: HER0_01 <aconrad103 at gmail.com>

pkgname=cota-git
pkgver=60.bfa90ee
pkgrel=1
pkgdesc="Log parser for the /stats command in Shroud of the Avatar"
arch=('i686' 'x86_64')
url="https://github.com/Barugon/CotA"
license=('NONE')
depends=('qt5-base')
makedepends=('git')
provides=('cota')
conflicts=('cota')
source=("$pkgname::git://github.com/Barugon/CotA.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -m755 -D ./CotA $pkgdir/usr/bin/cota
}
