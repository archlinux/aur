# Maintainer: friehmaen <fm@xers.de>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib2
pkgver=2.5.11
pkgrel=2
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format with IMF support"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('custom')
depends=('expat' 'openssl')
source=(http://download.cinecert.com/asdcplib/asdcplib-${pkgver}.tar.gz)
sha1sums=('96932a265d822a2cbbf3a0b3e4821140fee9dc89')

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

