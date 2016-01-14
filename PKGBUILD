# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>

_pkgname=skype1ico
pkgname="$_pkgname-git"
pkgver=1.0.0.2.r0.g34502c6
pkgrel=3
pkgdesc="Makes Skype systray icon monochrome"
arch=(x86_64 i686)
url="https://github.com/derlaft/skype1ico"
license=('GPL')
depends=(skype)
depends_x86_64=(lib32-qt4 lib32-libx11)
depends_i686=(qt4 libx11)
install=skype1ico.install
source=('git+https://github.com/derlaft/skype1ico.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  qmake-qt4 -spec linux-g++-32 PREFIX="$pkgdir/usr/"
  make
}

package() {
  cd "$_pkgname"
  make install
}

# vim:set ts=2 sw=2 et:
