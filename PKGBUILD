# Contributor: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-rgb
pkgver=1.0.6
pkgrel=1
pkgdesc="X colorname to RGB mapping database"
arch=(i686 x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/rgb-${pkgver}.tar.bz2)
sha256sums=('bbca7c6aa59939b9f6a0fb9fff15dfd62176420ffd4ae30c8d92a6a125fbe6b0')

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
