# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald
pkgver=0.8.12
pkgrel=1
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-12-release-announcement/"
license=('GPL')
depends=('compiz-core>=0.8.10' 'libwnck' 'gtk2' 'libxres' 'shared-mime-info' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
options=(!libtool)
conflicts=('emerald0.9')
install=emerald.install
source=("emerald-${pkgver}.tar.xz::http://www.northfield.ws/projects/compiz/releases/${pkgver}/emerald.tar.xz")

build() {
  cd "${srcdir}/${pkgname}"

  LIBS+="-lm -ldl" ./autogen.sh --prefix=/usr --with-gtk=2.0

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('bcbd61c740728c1b38dffa6c28f275f1c8fce0c583d5f51a7889f2f4cf077b20')
