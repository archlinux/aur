# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-extra
pkgver=0.8.12
pkgrel=2
pkgdesc="Compiz Fusion Extra plugins"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-12-release-announcement/"
license=('GPL')
depends=('compiz-core>=0.8.10' 'compiz-bcop' 'compiz-fusion-plugins-main' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-extra-git')
options=('!libtool')
source=("compiz-fplugs-extra-${pkgver}.tar.xz::http://www.northfield.ws/projects/compiz/releases/${pkgver}/plugins-extra.tar.xz")

build() {
  cd "${srcdir}/plugins-extra"
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/plugins-extra"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('a534b1266190aa8a384f028d67ed9a2ff3fc1b8173dac84a5a21b257ce00cad6')
