# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

_pluginname=durchblick
pkgname=obs-$_pluginname
pkgver=0.5.0
pkgrel=1
pkgdesc="Modular multiview for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/durchblick.1484/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$_pluginname-$pkgver.tar.gz"::"https://git.vrsal.xyz/alex/$_pluginname/archive/v$pkgver.tar.gz")
sha256sums=("5d8abffbd5a41c507ee73c76961cc39485abbda7a81463c3e11ca773e93c9036")

build() {
  cmake -B build -S $_pluginname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6
  cmake --build  build
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
 
