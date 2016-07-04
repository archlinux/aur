# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=ffmpegthumbs-mattepaint
pkgver=0.7
pkgrel=2
pkgdesc="An alternative version of the standard KDE ffmpegthumbs."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/FFMpegThumbs-MattePaint?content=153902"
license=('GPL')
depends=('ffmpeg' 'kio')
makedepends=('extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1467623621/153902-Upload2016060900.tar.gz")
sha256sums=('2e4c9fe5e85d9c14b1c468e0dcaecfd71b378ca38f051c0beea6a5f04b5c6cd4')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../Upload2016060900/KF5/"0.7 using ffmpeg-3.0"/${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
