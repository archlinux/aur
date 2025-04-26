# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=libunarr
pkgver=1.1.1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/selmf/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=("https://github.com/selmf/unarr/releases/download/v${pkgver}/unarr-${pkgver}.tar.xz")
makedepends=('cmake' 'git' 'ninja')
depends=('zlib' 'bzip2' 'xz')
conflicts=('libunarr-git')

md5sums=('e3848dba8c655230c105b574a533a825')

build() {
  cd "${srcdir}/unarr-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -GNinja -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  ninja
}

package() {
  cd "${srcdir}/unarr-${pkgver}"
  DESTDIR=$pkgdir ninja install
}
