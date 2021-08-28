# Contributor: Doug Newgard <scimmia at archlinux dot info>

_pkgname=qmltermwidget
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.2.0.r186.g65e75bc
pkgdesc='QML port of qtermwidget - development version'
arch=('x86_64')
url='https://github.com/Swordfish90/qmltermwidget'
license=('GPL')
depends=('qt5-declarative')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/Swordfish90/qmltermwidget.git")
sha512sums=('SKIP')

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

  make -j1 INSTALL_ROOT="$pkgdir" install
}
