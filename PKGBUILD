# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-extra-git
pkgver=0.8.10.r2.g9fe0124
pkgrel=1
pkgdesc="Compiz Fusion Extra plugins"
arch=('i686' 'x86_64')
url="http://git.northfield.ws/compiz/?p=compiz/plugins-extra;a=summary"
license=('GPL')
depends=('compiz-core-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-extra')
provides=('compiz-fusion-plugins-extra')
options=('!libtool')
source=(
	'git://northfield.ws/compiz/plugins-extra'
)

pkgver() {
  cd "${srcdir}/plugins-extra"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/plugins-extra"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/plugins-extra"
  make DESTDIR="${pkgdir}" install
}

sha1sums=('SKIP')
