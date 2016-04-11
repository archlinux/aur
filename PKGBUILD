# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-experimental"
_pkgver=0.8.12
_micro=""

pkgname=compiz-fusion-plugins-experimental
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compiz Experimental plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'compiz-bcop' 'compiz-fusion-plugins-extra' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion')
conflicts=('compiz-fusion-plugins-experimental-git')
options=('!libtool')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

build() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  #NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('ba337e9bd482d6eff8dec4a840e3fda1091513a38a581a37cdd45021cc7404b5')
