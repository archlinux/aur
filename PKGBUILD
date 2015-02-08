# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmtimer
pkgver=2.92
pkgrel=4
pkgdesc="A dockable WindowMaker app (docklet) alarm clock for which can be run in alarm, countdown timer, or chronograph mode."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.darkops.net/wmtimer/"
depends=('libxpm' 'gtk2')
#source=("http://www.darkops.net/wmtimer/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/bbidulock/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('425bbb4b0cc852f858da025538d7c900')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
