# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib
pkgver=2.10.38
_pkgver=2_10_38
pkgrel=1
pkgdesc="Open Source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('GPL3')
depends=('openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cinecert/asdcplib/archive/rel_${_pkgver}.tar.gz")
sha256sums=('f8cb3b1fecfe18f1a64e12e96e5696480631509e9088e29f5a259eb25b1b1656')

prepare() {
  cd ${pkgname}-rel_${_pkgver}
  autoreconf -if
  ./configure --enable-freedist --enable-as-02 --prefix=/usr
}

build() {
  cd ${pkgname}-rel_${_pkgver}
  make
  make dist
}

package() {
  cd ${pkgname}-rel_${_pkgver}
  make DESTDIR=${pkgdir} install
}
