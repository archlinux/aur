# $Id: PKGBUILD,v 1.11 2007/12/03 22:16:47 tobias Exp $
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=xfce4-artwork
pkgver=0.1
pkgrel=5
pkgdesc="Backdrops for the Xfce4 desktop"
arch=(i686 x86_64)
license=("GPL2")
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfdesktop')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://ftp.berlios.de/pub/xfce4-goodies/artwork/${pkgname}-${pkgver}.tar.gz)
md5sums=('b7612ee950fcf052e5acfacd0fda729f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg/ install
}
