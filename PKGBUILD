# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fyre
pkgver=1.0.1
pkgrel=11
pkgdesc="Rendering of the Peter de Jong map"
arch=('x86_64')
url="http://fyre.navi.cx/"
license=('GPL')
depends=('openexr' 'libglade' 'gnet' 'shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils')
source=(http://releases.navi.cx/fyre/fyre-${pkgver}.tar.bz2)
sha1sums=('41c0ec45eff16cc1bba081c5c855a3980e404835')

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
