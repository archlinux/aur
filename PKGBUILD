# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>
pkgname=burning-windows
pkgver=0.1.2
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
source=("burning-windows-0.1.2.tar.gz::https://github.com/yousefvand/Burning-Windows/archive/refs/tags/0.1.2.tar.gz")
sha256sums=('28891b2bfadaff6854101ba140607fec53c93b4d41cfae9d7faed123f5cfff7e')

build() {
  cmake -S "$srcdir/Burning-Windows-0.1.2" -B build -G Ninja     -DCMAKE_BUILD_TYPE=Release     -DCMAKE_INSTALL_PREFIX=/usr     -DKDE_INSTALL_LIBDIR=lib     -DKDE_INSTALL_LIBEXECDIR=lib     -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
