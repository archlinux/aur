# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Boris <arch at palatinux dot com>

pkgname=streamripper
epoch=1
pkgver=1.68.3
pkgrel=1
pkgdesc="Records and splits streaming mp3 into tracks"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Ashus/streamripper"
license=('GPL')
depends=('glib2' 'libmad' 'faad2' 'libvorbis')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('51ef60dec7e334358ef9271fe8d8055f0bbc2e383e4dcd4b33ca5cfeaef9b4e4')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../${pkgname}-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

