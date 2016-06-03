# Maintainer: friehmaen <fm@xers.de>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib2
pkgver=2.5.14
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format with IMF support"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('custom')
depends=('expat' 'openssl')

source=(http://download.cinecert.com/asdcplib/asdcplib-${pkgver}.tar.gz)
sha1sums=('23b9b459203d89d24ff0e6fceadc3b2bd6a6ff3b')
md5sums=('f84a4b30c6e8aca234e8327c99e6f512')

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

