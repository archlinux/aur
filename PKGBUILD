# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-rgb
pkgver=1.0.5
pkgrel=1
pkgdesc="X colorname to RGB mapping database"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(http://xorg.freedesktop.org/archive/individual/app/rgb-${pkgver}.tar.bz2)
sha256sums=('8e936e648ffddce2e7184790efa15e4fa2bcb47f9da5469515d212c61bc8f857')

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
