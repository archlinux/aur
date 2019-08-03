# Maintainer: Alejandro Valdes <alejandrovaldes@live.com>

pkgname=plasma5-applets-window-appmenu
pkgver=0.5.1
pkgrel=1
pkgdesc="Plasma 5 applet in order to show the window appmenu"
arch=(x86_64)
url="https://github.com/psifidotos/applet-window-appmenu"
license=(GPL)
depends=(plasma-workspace libxcb)
makedepends=(extra-cmake-modules)
optdepends=(
  'libdbusmenu-gtk3: gtk3 appmenu support'
  'libdbusmenu-gtk2: gtk2 appmenu support'
)
source=($pkgname-$pkgver.tar.gz::"https://github.com/psifidotos/applet-window-appmenu/archive/v$pkgver.tar.gz")
sha256sums=('890f55c36f64d7106276978e2133c4cd153a6345d11ae353522729d015be7f6a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../applet-window-appmenu-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
