# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.51
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=(i686 x86_64)
license=('GPL')
depends=('libxml2>=2.6.32' 'glib2>=2.18.1')
makedepends=('perlxml' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2)
md5sums=('01d72161f7d88123fbccd378871f02f0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-update-mimedb || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
