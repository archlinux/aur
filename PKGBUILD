# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.40
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=(i686 x86_64)
license=('GPL')
depends=('libxml2' 'glib2')
makedepends=('perlxml' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b86a0aa5e87a307ede576088c6450a29')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/share/mime/mime.cache
}
