# Maintainer: Chris <chris.charles.allison+aur@gmail.com>
pkgname=dvbstreamer-t2
pkgver=2.1.22
pkgrel=1
pkgdesc="Console-based application to stream DVB services over UDP (Stable DVB-T2 Release)"
arch=('x86_64' 'aarch64')
url="https://github.com/ccdale/dvbstreamer"
license=('GPL-2.0-only')
depends=('sqlite' 'readline' 'libev' 'libtool' 'libyaml' 'zlib')
makedepends=('autoconf' 'automake' 'pkg-config')
provides=('dvbstreamer')
conflicts=('dvbstreamer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b526d9ef5e50534a5007a7a38434863dfd70f065a518d626bab96bedf64350f1')

prepare() {
  cd "dvbstreamer-${pkgver}"
  ./autogen.sh
}

build() {
  cd "dvbstreamer-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "dvbstreamer-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
