# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvd-audio-git
pkgver=v1.0.0.3.gc74bdfc
pkgrel=1
pkgdesc="A C library for extracting audio from DVD-Audio discs. (GIT version)"
arch=('x86_64')
url='http://libdvd-audio.sourceforge.net'
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('libdvd-audio')
conflicts=('libdvd-audio')
source=('git+https://github.com/tuffy/libdvd-audio.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvd-audio
  echo "$(git describe --always | tr - .)"
}

build() {
  cd libdvd-audio
  make
}

package() {
  cd libdvd-audio
  install -d ${pkgdir}/usr/{include,bin,lib{,/pkgconfig}}
  make BIN_DIR=${pkgdir}/usr/bin LIB_DIR=${pkgdir}/usr/lib INCLUDE_DIR=${pkgdir}/usr/include LIB_DIR=${pkgdir}/usr/lib PKG_CONFIG_DIR=${pkgdir}/usr/lib/pkgconfig install
}
