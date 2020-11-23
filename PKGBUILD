# $Id$
# Maintainter: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-main"
_pkgver=0.8.18
_micro=""

pkgname=compiz-fusion-plugins-main
pkgver="${_pkgver}${_micro}"
pkgrel=2
pkgdesc="Compiz Main plugins"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${_pkgver}" 'libjpeg-turbo' 'librsvg' 'compiz-bcop' 'libxdamage' 'libxcomposite'
	'libxinerama' 'startup-notification')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion')
conflicts=('compiz-fusion-plugins-main-git')
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2")
options=(!libtool)


build() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('3125ff654b3a422b819d5b5d90406d4efc8fa4c7a66cc4a63efe6597574ad549')
