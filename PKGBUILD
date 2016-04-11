# $Id$
# Maintainter: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-main"
_pkgver=0.8.12
_micro=.2

pkgname=compiz-fusion-plugins-main
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compiz Main plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${_pkgver}" 'libjpeg>=7' 'librsvg' 'compiz-bcop' 'libxdamage' 'libxcomposite'
	'libxinerama' 'startup-notification')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion')
conflicts=('compiz-fusion-plugins-main-git')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")
options=(!libtool)


build() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('fd52234b594ba28a14243443d6e77fefa180cbedccafbb059ec2c32803340f66')
