# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=kde-thumbnailer-mp4cover
pkgver=0.1
pkgrel=1
pkgdesc="MP4 video cover art thumbnail generator"
arch=(x86_64)
url="https://github.com/velnias75/kde-thumbnailer-mp4cover"
license=(GPL2)
depends=(kio taglib)
makedepends=(extra-cmake-modules)
source=("https://launchpad.net/~velnias/+archive/ubuntu/velnias/+sourcefiles/${pkgname}/${pkgver}-2~bionic/${pkgname}_${pkgver}.orig.tar.xz")
sha512sums=('0890305fe7ca2b56883cb6dd8953c5dd00085b1cd20a5f8deda16d6be5b230a59e4832d6c4d7419a7ea1554878e3c2057d90b73b71ad77eecf60afb66783afc3')

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
