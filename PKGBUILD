# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=xf86-video-openchrome
pkgver=0.2.904
_svnver=r933
pkgrel=6
pkgdesc="X.Org Openchrome drivers"
arch=(i686 x86_64)
license=('custom')
url="http://www.openchrome.org"
depends=('libdrm' 'libxvmc' 'unichrome-dri')
makedepends=('xorg-server-devel>=1.11.0' 'libdrm' 'xf86driproto' 'mesa' 'libxvmc' 'glproto')
replaces=('openchrome' 'xf86-video-via')
options=('!libtool' '!makeflags')
conflicts=('xf86-video-via' 'xf86-video-unichrome' 'openchrome' 'xorg-server<1.11.0')
source=(ftp://ftp.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}-${_svnver}.tar.bz2)
md5sums=('d661460276a31d3d012d8cdb1a0a73c1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
