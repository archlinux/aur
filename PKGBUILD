# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmweather
pkgver=2.4.8
pkgrel=1
pkgdesc="Shows local weather conditions in a WindowMaker dockapp"
arch=('i686' 'x86_64')
url="https://www.dockapps.net/wmweather"
license=('GPL')
groups=('x11')
depends=('libxpm')
options+=('!debug')
source=(https://people.debian.org/~godisch/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('34d8c9fef4a4d62983df08d489c87a4c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

