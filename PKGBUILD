# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>
pkgname=burning-windows
pkgver=0.1.0
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
  'git'
  'cmake'
  'extra-cmake-modules'
  'ninja'
  'gcc'
)
install='burning-windows.install'
source=("burning-windows-0.1.0.tar.gz::https://github.com/yousefvand/Burning-Windows/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('5ab4be06a5b5f70cc42ef63130593c6d0992fdd174102858de82e182284367c9')

build() {
  cmake -S "$srcdir/Burning-Windows-0.1.0" -B build -G Ninja     -DCMAKE_BUILD_TYPE=Release     -DCMAKE_INSTALL_PREFIX=/usr     -DKDE_INSTALL_LIBDIR=lib     -DKDE_INSTALL_LIBEXECDIR=lib     -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
