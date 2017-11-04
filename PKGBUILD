# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=libunarr
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/selmf/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=("https://github.com/selmf/unarr/releases/download/v${pkgver}/unarr-${pkgver}.tar.xz")
makedepends=('cmake' 'git')
depends=('zlib' 'bzip2' 'xz')
conflicts=('libunarr-git')

md5sums=('995a3de03b8a083c342e7d4b5a44fd52')

build() {
  cd "${srcdir}/unarr-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/unarr-${pkgver}"
  make DESTDIR=$pkgdir install
}
