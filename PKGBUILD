# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>

pkgname=c++-gtk-utils
pkgver=2.2.19
pkgrel=1
pkgdesc="Classes and functions for programming in GTK+"
arch=('x86_64')
url="http://cxx-gtk-utils.sourceforge.net/"
license=('LGPL2.1')
depends=('gtk3')
options=('!docs' '!emptydirs')
source=("https://downloads.sourceforge.net/project/cxx-gtk-utils/cxx-gtk-utils/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('382abe260863dc1ef84f912bcbc57414a0dd0d6fe622694fea2f5a042a04dd88')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
     --prefix=/usr \
     --disable-rpath \
     --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
