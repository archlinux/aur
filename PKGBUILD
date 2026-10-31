# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=libunarr
pkgver=1.2.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/selmf/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=("https://github.com/selmf/unarr/releases/download/v${pkgver}/unarr-${pkgver}.tar.xz")
makedepends=('cmake' 'git' 'ninja')
depends=('zlib' 'bzip2' 'xz')
conflicts=('libunarr-git')

sha256=('e3848dba8c655230c105b574a533a825')

build() {
  cd "${srcdir}/unarr-${pkgver}"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -GNinja
  ninja -C build
}

package() {
  cd "${srcdir}/unarr-${pkgver}"
  DESTDIR=$pkgdir ninja -C build install
}
sha256sums=('051a2f4ce66949e42924e5af02b721d81722dfa09b69df0f473719f9b8e946aa')
