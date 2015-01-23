# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=qmltermwidget-git
pkgrel=1
pkgver=0.6.0.r37.g4d93f02
pkgdesc='QML port of qtermwidget'
arch=('i686' 'x86_64')
url='https://github.com/Swordfish90/qmltermwidget'
license=('GPL')
depends=('qt5-declarative')
makedepends=('git')
conflicts=('cool-retro-term-git<1.0.0RC1.r39')
source=("git://github.com/Swordfish90/qmltermwidget.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/${pkgname%-*}"

  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-*}"

  qmake
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make INSTALL_ROOT="$pkgdir" install
}
