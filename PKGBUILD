# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib
pkgver=2.10.35
pkgrel=1
pkgdesc="Open Source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('GPL-3.0')
depends=('expat' 'openssl')
source=("https://github.com/cinecert/asdcplib/archive/rel_2_10_35.tar.gz")
md5sums=('4639926c64c1c752ad4f1550f6a025c2')

build() {
  cd ${pkgname}-rel_2_10_35
  autoreconf -if
  ./configure --enable-freedist --enable-as-02 --prefix=/usr
  make
  make dist
}

package() {
  cd ${pkgname}-rel_2_10_35
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}