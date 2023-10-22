# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-rgb
pkgver=1.1.0
pkgrel=1
pkgdesc="X colorname to RGB mapping database"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/rgb-${pkgver}.tar.gz)
sha256sums=('77142e3d6f06cfbfbe440e29596765259988a22db40b1e706e14b8ba4c962aa5')

build() {
  cd "${srcdir}/rgb-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/rgb-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
