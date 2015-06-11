# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: gh0stwizard <vitaliy.tokarev@gmail.com>

pkgname=wmifinfo
pkgver=0.09
pkgrel=4
pkgdesc="A simple applet showing basic network configuration for all available interfaces"
arch=('i686' 'x86_64')
url="http://zevv.nl/play/code/wmifinfo/"
license=('GPL')
depends=('libxpm')
source=("http://zevv.nl/play/code/wmifinfo/${pkgname}-${pkgver}.tgz")
md5sums=('0c7a2a65e756cf41d94dea3e9268c7e7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
