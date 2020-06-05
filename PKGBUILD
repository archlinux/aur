# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-ukui-platformtheme-git
pkgver=v1.0.2.r62.ga9a9e59
pkgrel=1
pkgdesc="qt5 platform theme for UKUI"
arch=('x86_64')
license=('GPL')
url="https://github.com/ukui/qt5-ukui-platformtheme"
groups=('ukui')
depends=('dconf' 'gsettings-qt' 'kwindowsystem')
makedepends=('qt5-tools' 'git')
conflicts=('qt5-ukui-platformtheme')
provides=('qt5-ukui-platformtheme')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd qt5-ukui-platformtheme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd qt5-ukui-platformtheme
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd qt5-ukui-platformtheme
  make INSTALL_ROOT="$pkgdir" install
}
