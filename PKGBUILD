# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>
pkgname=burning-windows
pkgver=0.1.1
pkgrel=1
pkgdesc='Burning Windows effect for KDE Plasma/KWin'
arch=('x86_64')
url='https://github.com/yousefvand/Burning-Windows'
license=('GPL')
depends=(
  'kwin'
  'kcoreaddons'
  'kconfig'
  'kconfigwidgets'
  'ki18n'
  'kcmutils'
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
  'gcc'
)
install='burning-windows.install'
source=("burning-windows-0.1.1.tar.gz")
sha256sums=('2fffa580dda66dd0c2da9a62eefb4259688cc392d32fa2063a2987ae160d0776')

build() {
  cmake -S "$srcdir/burning-windows-0.1.1" -B build -G Ninja     -DCMAKE_BUILD_TYPE=Release     -DCMAKE_INSTALL_PREFIX=/usr     -DKDE_INSTALL_LIBDIR=lib     -DKDE_INSTALL_LIBEXECDIR=lib     -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
