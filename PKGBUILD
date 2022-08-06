# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-settings-git
_pkgname=piscesde-settings
pkgver=0
pkgrel=2
pkgdesc="System Settings application for piscesDE"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libpiscesde-git' 'modemmanager-qt' 'networkmanager-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd settings

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings
  make DESTDIR="$pkgdir" install
}
