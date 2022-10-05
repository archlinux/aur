# Maintainer: sxe <sxxe@gmx.de>

pkgname='yakuake-sessions'
pkgdesc='Remember your yakuake session - directory, splitting terminal and virtual environment'
pkgver=84d235f
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/UfoDriver/yakuake-sessions'
license=('unknown')
depends=('qt5-base')
makedepends=('git')
source=('git+https://github.com/UfoDriver/yakuake-sessions.git')
md5sums=('SKIP')

pkgver() {
  #date +%Y%m%d
  cd "$srcdir/$pkgname"
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^wine.//'
}

build() {
  cd "$srcdir/yakuake-sessions"
  qmake-qt5
  make
}

package() {
  cd "$srcdir/yakuake-sessions"
  install -Dm755 'yakuake-sessions' "$pkgdir/usr/bin/yakuake-sessions" 
}
