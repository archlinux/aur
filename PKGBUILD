# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=systemd-bootchart
pkgver=233
pkgrel=1
pkgdesc='Boot performance graphing tool'
arch=('x86_64')
url='https://github.com/systemd/systemd-bootchart'
license=('GPL2' 'LGPL2.1')
depends=('libsystemd')
makedepends=('docbook-xsl')
source=("https://github.com/systemd/systemd-bootchart/releases/download/v${pkgver}/systemd-bootchart-${pkgver}.tar.xz")
md5sums=('fbe3fa306d4d0066301b9deadafbd157')

build() {
  cd "${srcdir}/systemd-bootchart-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/systemd-bootchart-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
