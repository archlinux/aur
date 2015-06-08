# $Id: PKGBUILD 62403 2010-01-08 07:09:14Z eric $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=0.9.7
pkgrel=1
pkgdesc="GTK+ frontend for libqalculate, without gnome dependencies"
arch=('i686' 'x86_64')
url="http://qalculate.sourceforge.net/"
license=('GPL')
depends=('libqalculate>=0.9.7' 'libglade' 'cln>=1.2.0')
makedepends=('perl-xml-parser' 'rarian')
replaces=('qalculate-gtk')
provides=('qalculate-gtk')
_nick=('qalculate-gtk')
source=(http://downloads.sourceforge.net/sourceforge/qalculate/${_nick}-${pkgver}.tar.gz)
md5sums=('7a7ab4680e285690ca3625992f477f0f')
sha1sums=('c714c91224045fa49f261686e985df0aefa1d678')

build() {
  cd "${srcdir}/${_nick}-${pkgver}"
  ./configure --prefix=/usr --without-libgnome || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_nick}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
