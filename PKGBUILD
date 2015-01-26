# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=qmltermwidget
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.1.0.r2.g4d93f02
pkgdesc='QML port of qtermwidget - development version'
arch=('i686' 'x86_64')
url='https://github.com/Swordfish90/qmltermwidget'
license=('GPL')
depends=('qt5-declarative')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'cool-retro-term-git<1.0.0RC1.r39')
source=("git://github.com/Swordfish90/qmltermwidget.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"

  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  qmake
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install
}
