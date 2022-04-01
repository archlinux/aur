# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=wxmaxima
pkgver=22.03.0
pkgrel=1
pkgdesc="A wxWidgets GUI for the computer algebra system Maxima"
arch=('x86_64')
url="https://wxmaxima-developers.github.io/wxmaxima/"
license=('GPL2')
depends=('maxima' 'wxgtk3')
makedepends=('cmake')
source=(https://github.com/wxMaxima-developers/wxmaxima/archive/Version-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2192f804588511e9a796ad0b677e6f4721bb2cf2a52766f3d47f4528ad0ce0a4')

build() {
  cmake -B build -S ${pkgname}-Version-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3
  cmake --build build
}

#check() {
#  cd ${pkgname}-Version-${pkgver}
#  ./src/wxmaxima test/testbench_simple.wxmx
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
