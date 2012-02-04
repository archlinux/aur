# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=1.0
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'glib2')
makedepends=('intltool' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.xz)
md5sums=('901b7977dbb2b71d12d30d4d8fb97028')
options=(!makeflags)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-update-mimedb
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
