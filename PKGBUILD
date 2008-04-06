# $Id: PKGBUILD,v 1.10 2007/10/10 15:39:15 alexander Exp $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-vmware
pkgver=10.15.2
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.4')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('99322cbcc9081ad44e9cba63e3df8f7e')
