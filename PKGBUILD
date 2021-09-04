# Maintainer: Dominik Kummer <admin[at]arkades[dot]org>
pkgname=somafm-qt-git
pkgver=v0.1.r19.g0179f9c
pkgrel=1
pkgdesc="A player for somafm.com radio channels written in qt5/c++"
url="http://www.github.com/josefbehr/somafm-qt"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-base' 'qt5-multimedia')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/josefbehr/somafm-qt.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed 's/ver_//;s/_/./g;s/-/.r/;s/-/./'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -D somafm-qt "$pkgdir/usr/bin/somafm-qt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/COPYING"
}

# vim:set ts=2 sw=2 et:
