# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald
pkgver=0.8.10
pkgrel=2
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-10-release-announcement/"
license=('GPL')
depends=('compiz-core>=0.8.10' 'libwnck' 'gtk2' 'libxres' 'shared-mime-info' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
options=(!libtool)
conflicts=('emerald0.9')
install=emerald.install
source=(http://www.northfield.ws/projects/compiz/releases/${pkgver}/emerald.tar.gz)
sha1sums=('01544a6e97acc954ea924403904f32c7c556302f')

build() {
  cd "${srcdir}/${pkgname}"

  LIBS+="-lm -ldl" ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
