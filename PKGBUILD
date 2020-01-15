# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fyre
pkgver=1.0.1
pkgrel=13
pkgdesc="Rendering of the Peter de Jong map"
arch=('x86_64')
url="http://fyre.navi.cx/"
license=('GPL')
depends=('openexr' 'libglade' 'gnet' 'shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils')
source=(http://releases.navi.cx/fyre/fyre-${pkgver}.tar.bz2)
sha512sums=('8e65e6ef05c2919659e173b04815579cd550a5d98539860d600d2dd68561493badb98b3eff2cf131335aee9b8b848ceb30956c194a7a69b855e9397679c1c675')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make update_xdgmime=/bin/false update_fdodesktop=/bin/false gtk_update_icon_cache=/bin/false \
    prefix="${pkgdir}/usr" install
}
