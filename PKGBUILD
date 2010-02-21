# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.6.2
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=(i686 x86_64)
license=('GPL')
depends=('libsoup-gnome>=2.29.90')
makedepends=('pkgconfig' 'intltool' 'gir-repository')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('a6b492133a92ec5e3b457b8e6c74a3fec72cfc1ac6e4421b82f6be0458738e88')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
