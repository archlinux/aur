# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware
pkgver=11.0.2
pkgrel=2
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm')
makedepends=('pkgconfig' 'xorg-server-devel' 'libdrm')
conflicts=('xorg-server<1.9.0')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('7598145097971437cf0bfc0445e4435602159b41')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
