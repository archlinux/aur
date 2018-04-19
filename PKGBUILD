# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>

pkgname=f3-qt-git
pkgver=v2.0.0.r4.g9445116
pkgrel=2
pkgdesc="This is a simple GUI for F3 - Fight Flash Fraud."
arch=('i686' 'x86_64')
url="https://github.com/zwpwjwtz/f3-qt"
license=('GPL3')
makedepends=('git' 'qt5-base')
depends=('f3' 'qt5-base')
provides=('f3-qt')
conflicts=('f3-qt')
source=('git+https://github.com/zwpwjwtz/f3-qt.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/f3-qt"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/f3-qt"
}

build() {
  cd "$srcdir/f3-qt"
  qmake -config release
  make
}

package() {
  cd "$srcdir/f3-qt"
  msg2 'Installing f3-qt...'
  install -Dm755 "$srcdir/f3-qt/f3-qt" "$pkgdir/usr/bin/f3-qt"
}

# vim:set ts=8 sts=2 sw=2 et:
