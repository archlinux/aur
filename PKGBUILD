# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=bashrun2
pkgver=0.2.4
pkgrel=1
pkgdesc="Launch applications from interactive bash sessions"
arch=('i686' 'x86_64')
url="http://henning-bekel.de/${pkgname}"
license=('GPL2')
depends=('bash' 'libx11')
source=("http://henning-bekel.de/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('e75532859a072175e85015e7af92ea40')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  chmod +x ./configure
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
