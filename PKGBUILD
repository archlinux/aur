# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-kwin-plugins-git
_pkgname=piscesde-kwin-plugins
pkgver=0
pkgrel=2
pkgdesc="piscesDE KWin Plugins"
arch=('x86_64')
url="https://github.com/piscesys/kwin-plugins"
license=('GPL')
groups=('piscesde-git')
depends=('kconfig' 'kdecoration' 'kguiaddons' 'kcoreaddons' 'kconfigwidgets' 'kwindowsystem'
         'kwayland' 'kwin' 'kdeclarative' 'plasma-framework' 'piscesde-fishui-git')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "deepin-kwin")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd kwin-plugins

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd kwin-plugins
  DESTDIR="$pkgdir" ninja install
}
