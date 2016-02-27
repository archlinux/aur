# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=bashrun2
pkgver=0.2.3
pkgrel=1
pkgdesc="Launch applications from interactive bash sessions"
arch=('i686' 'x86_64')
url="http://henning-bekel.de/${pkgname}"
license=('GPL2')
depends=('bash' 'libx11')
source=("http://henning-bekel.de/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('dbe9e4f3ca1effcf66d9d2c9b08d7857')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
