# Maintainer: asyncial <asyncial [dot] posteo [dot] de>

pkgname=midna-theme
pkgver=2.1.0
pkgrel=1
pkgdesc='KaOS Plasma 5 Look & Feel theme files'
url='http://kaosx.us'
arch=('x86_64')
license=('LGPL')
depends=('plasma-framework' 'qtcurve-qt5' 'ttf-raleway')
makedepends=('extra-cmake-modules')
conflicts=('kde-kdm-themes-midna'
           'kde-ksplash-themes-midna'
           'kde-plasma-themes-midna' )
replaces=('kde-kdm-themes-midna'
          'kde-ksplash-themes-midna'
          'kde-plasma-themes-midna' )
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
