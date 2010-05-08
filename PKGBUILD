# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=gob2
pkgver=2.0.17
pkgrel=1
pkgdesc="GTK Object Builder (GOB) is a simple preprocessor for easily creating GTK objects"
arch=(i686 x86_64)
license=('GPL')
depends=('glib2')
url="http://www.5z.com/jirka/gob.html"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.0/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('e9f52fff7ada88a36da1d412f8b2b57b44cc0527e545cf2f5d873c002c0da7f4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
