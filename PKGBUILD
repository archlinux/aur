# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

_pluginname=durchblick
pkgname=obs-$_pluginname
pkgver=0.5.0
pkgrel=3
pkgdesc="Modular multiview for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/durchblick.1484/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$_pluginname-$pkgver.tar.gz"::"https://github.com/univrsal/$_pluginname/archive/v$pkgver.tar.gz")
sha256sums=(""3f16c4dfff3f31d7683ce2c3180f8659c14f1fc7a14553ff8ad293269674a893)

build() {
  cmake -B build -S "$_pluginname-$pkgver" \
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
 
