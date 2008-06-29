# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.30
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=(i686 x86_64)
license=('GPL')
depends=('libxml2' 'glib2')
makedepends=('perlxml' 'pkgconfig')
options=('force')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2)
md5sums=('115316be6bb5e3dd8c667742a4301678')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-update-mimedb || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
