# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-extra-git
pkgver=0.8.12.r2.g880f9da
pkgrel=1
pkgdesc="Compiz Fusion Extra plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/compiz-plugins-extra"
license=('GPL')
depends=('compiz-core-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-extra')
provides=('compiz-fusion-plugins-extra')
options=('!libtool')
source=(
	'git+https://github.com/compiz-reloaded/compiz-plugins-extra.git'
)

pkgver() {
  cd "${srcdir}/compiz-plugins-extra"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/compiz-plugins-extra"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/compiz-plugins-extra"
  make DESTDIR="${pkgdir}" install
}

sha1sums=('SKIP')
