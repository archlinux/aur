# Maintainer: friehmaen <fm@xers.de>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib2
pkgver=2.5.12
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format with IMF support"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('custom')
depends=('expat' 'openssl')
source=(http://download.cinecert.com/asdcplib/asdcplib-${pkgver}.tar.gz)
sha1sums=('dbe5103c719cee3e3c1f6d06d4f5ff1578d2c19a')

build() {
  cd asdcplib-${pkgver}
  ./configure --prefix=/usr --enable-as-02
  make
}

package() {
  cd asdcplib-${pkgver}
  make DESTDIR=${pkgdir} install

  #copy license file
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

