# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-extra"
_pkgver=0.8.14
_micro=""

pkgname=compiz-fusion-plugins-extra
pkgver="${_pkgver}${_micro}"
pkgrel=4
pkgdesc="Compiz Extra plugins"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${pkgver}" 'compiz-bcop' 'compiz-fusion-plugins-main' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion')
conflicts=('compiz-fusion-plugins-extra-git')
options=('!libtool')
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('5727942e99759392adac3d69ec98f481fedac96ef392afc44086c7745b64c17c')
