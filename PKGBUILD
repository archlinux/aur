# $Id: PKGBUILD 62403 2010-01-08 07:09:14Z eric $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=0.9.8
pkgrel=2
pkgdesc="GTK+ frontend for libqalculate, without gnome dependencies"
arch=('i686' 'x86_64')
url="http://qalculate.github.io/"
license=('GPL')
depends=("libqalculate>=${pkgver}" 'gtk3' 'cln>=1.2.0')
makedepends=('perl-xml-parser' 'rarian' 'intltool')
replaces=('qalculate-gtk')
provides=('qalculate-gtk')
_nick=('qalculate-gtk')
source=(http://downloads.sourceforge.net/sourceforge/qalculate/${_nick}-${pkgver}.tar.gz)

build() {
  cd "${srcdir}/${_nick}-${pkgver}"
  ./configure --prefix=/usr --without-libgnome || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_nick}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

md5sums=('73a5139a89bc1c31e059870010dabc2f')
sha1sums=('ddc87ce66607790e46a5691e0d441270b3151be7')
