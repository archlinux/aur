# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=libunarr
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/selmf/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=("https://github.com/selmf/unarr/releases/download/v${pkgver}/unarr-${pkgver}.tar.xz")
makedepends=('cmake' 'git' 'ninja')
depends=('zlib' 'bzip2' 'xz')
conflicts=('libunarr-git')

md5sums=('dfe85c00b9a34bd6ad8384882a827020')

build() {
  cd "${srcdir}/unarr-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -GNinja
  ninja
}

package() {
  cd "${srcdir}/unarr-${pkgver}"
  DESTDIR=$pkgdir ninja install
}
