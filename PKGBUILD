# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtkam
pkgver=1.0
pkgrel=2
pkgdesc="A GTK frontend for libgphoto2"
url="http://gphoto.sourceforge.net/proj/gtkam"
arch=('i686' 'x86_64')
depends=('libgphoto2>=2.5.0' 'libexif>=0.3.2' 'libexif-gtk' 'gdk-pixbuf2')
makedepends=('gimp' 'intltool')
license=('GPL')
source=(http://downloads.sourceforge.net/project/gphoto/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        http://downloads.sourceforge.net/project/gphoto/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
source=(http://downloads.sourceforge.net/project/gphoto/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f9156394632ac54731d1eea5e2529e7c'
         'SKIP')
md5sums=('f9156394632ac54731d1eea5e2529e7c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc \
    --without-bonobo --without-gnome --disable-scrollkeeper

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
