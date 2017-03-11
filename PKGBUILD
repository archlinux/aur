# Maintainer: BrLi <brli@chakralinux.org>
# Contributor: AlmAck

pkgname=plasma5-themes-chakra-heritage
pkgver=2016.12
pkgrel=1
pkgdesc='Chakra Plasma 5 Look & Feel theme files'
url='http://www.chakralinux.org'
arch=('x86_64')
license=('LGPL')
# remember to set the wallpaper name and resolution!! in plasma/heritage/metadata.desktop
depends=('plasma-framework')
makedepends=('extra-cmake-modules')
optdepends=('plasma5-wallpapers-chakra-tulip')

_gitsha='f72c02cc'
source=("git://git.chakralinux.org/heritage.git#commit=${_gitsha}")
md5sums=('SKIP')

prepare() {
    mkdir -p build
    cd $srcdir/heritage
}

build() {
  cd build
  
  cmake ../heritage \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON  
  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
