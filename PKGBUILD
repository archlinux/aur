# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=gxkb
pkgver=0.7.5
pkgrel=1
pkgdesc="X11 keyboard indicator and switcher"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gxkb"
license=('GPL2')
depends=('libxklavier' 'libwnck')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d8b56e1b99411a89e42511498aeae226')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm 644 debian/gxkb.xpm "${pkgdir}/usr/share/pixmaps/gxkb.xpm"
  install -Dm 644 debian/gxkb.desktop "${pkgdir}/usr/share/applications/gxkb.desktop"
}
