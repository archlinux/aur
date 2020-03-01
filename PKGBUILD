# Maintainer: asyncial <asyncial [at] posteo [dot] de>

pkgname=midna-theme
pkgver=5.0.4
pkgrel=1
pkgdesc='KaOS Plasma 5 Look & Feel theme files'
url='http://kaosx.us'
arch=('x86_64')
license=('LGPL')
depends=('plasma-framework' 'qtcurve-kde' 'ttf-raleway' 'kvantum-qt5')
makedepends=('extra-cmake-modules')
conflicts=('kde-kdm-themes-midna'
           'kde-ksplash-themes-midna'
           'kde-plasma-themes-midna'
           'midna-colors'
           'wallpapers-midna')
replaces=('kde-kdm-themes-midna'
          'kde-ksplash-themes-midna'
          'kde-plasma-themes-midna'
          'midna-colors'
          'wallpapers-midna')
source=("git://github.com/KaOSx/midna.git")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build

  cmake ../midna \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
