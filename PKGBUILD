# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-extra"
_pkgver=0.8.12
_micro=.1

pkgname=compiz-fusion-plugins-extra
pkgver="${_pkgver}${_micro}"
pkgrel=3
pkgdesc="Compiz Extra plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'compiz-bcop' 'compiz-fusion-plugins-main' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion')
conflicts=('compiz-fusion-plugins-extra-git')
options=('!libtool')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

build() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('35f88e5d5e25e620e97572cad28251df2de10946b8ee1d66468302e46c17662f')
