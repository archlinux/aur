# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=bashrun2
pkgver=0.2.6
pkgrel=2
pkgdesc="Launch applications from interactive bash sessions"
arch=('i686' 'x86_64')
url="http://henning-bekel.de/${pkgname}"
license=('GPL2')
depends=('bash' 'libx11')
source=("https://github.com/hbekel/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('32f71cdae685705cbbe1390015482c0e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
