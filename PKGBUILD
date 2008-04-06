# $Id: PKGBUILD,v 1.13 2008/01/29 17:44:44 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.23
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=(i686 x86_64)
license=('GPL')
depends=('libxml2' 'glib2')
makedepends=('perlxml' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3120a720f6a94881614b533f37a7671f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/share/mime/mime.cache
}
