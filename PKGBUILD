# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-extra
pkgver=0.8.10
pkgrel=1
pkgdesc="Compiz Fusion Extra plugins"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-10-release-announcement/"
license=('GPL')
depends=('compiz-core>=0.8.10' 'compiz-bcop' 'compiz-fusion-plugins-main' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext' 'gconf')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-extra-git')
options=('!libtool')
source=(http://www.northfield.ws/projects/compiz/releases/${pkgver}/plugins-extra.tar.gz)
md5sums=('482b776e2cf0b846fee9798c4e164f83')

build() {
  cd "${srcdir}/plugins-extra"
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "${srcdir}/plugins-extra"
  make DESTDIR="${pkgdir}" install
}
