# Maintainer: Adam Perkowski <adas1per@protonmail.com>

# Contributor: Doug Newgard <scimmia at archlinux dot info>

_pkgname=qmltermwidget
pkgname=$_pkgname-git
pkgrel=1
pkgver=0.2.0+r6322802
pkgdesc='QML port of qtermwidget - development version'
arch=('i686' 'x86_64')
url="https://github.com/Swordfish90/$_pkgname"
license=('GPL-2.0')
depends=('qt5-declarative')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/Swordfish90/$_pkgname")
sha512sums=(SKIP)

pkgver () {
  cd "$srcdir/$_pkgname"

  echo "$(git describe --tags --abbrev=0)+r$(git rev-parse --short HEAD)"
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
