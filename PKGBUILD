# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=kde-thumbnailer-mp4cover
pkgver=0.2
pkgrel=1
pkgdesc="MP4 video cover art thumbnail generator"
arch=(x86_64)
url="https://github.com/velnias75/kde-thumbnailer-mp4cover"
license=(GPL2)
depends=(ffmpeg kio taglib)
makedepends=(extra-cmake-modules)
source=("https://launchpad.net/~velnias/+archive/ubuntu/velnias/+sourcefiles/${pkgname}/${pkgver}-1~disco/${pkgname}_${pkgver}.orig.tar.xz")
sha512sums=('66252ffffb906f7b7a72a6f0dc82883c4652f3cceac251ccf48b4d510fe8a482f35488a7c7cac7ba337b5210cabc70612a60d7c2b00de437e3339db00f2cee7e')

build() {
  cd "${pkgname}-${pkgver}"
  cmake . \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
