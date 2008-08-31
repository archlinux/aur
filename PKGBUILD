# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-vmware
pkgver=10.16.5
pkgrel=1
pkgdesc="X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.4.99.906' 'randrproto' 'renderproto' 'xextproto' 'xineramaproto' 'videoproto')
conflicts=('xorg-server<1.4.99.906')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6d78c82ea7c2bb0fcb587d7bb4e8f60a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
