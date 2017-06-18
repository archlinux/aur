# $Id: PKGBUILD 62403 2010-01-08 07:09:14Z eric $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=0.9.12
pkgrel=1
pkgdesc="GTK+ frontend for libqalculate, without gnome dependencies"
arch=('i686' 'x86_64')
url="http://qalculate.github.io/"
license=('GPL')
depends=("libqalculate>=${pkgver}" 'gtk3' 'cln>=1.2.0')
makedepends=('perl-xml-parser' 'rarian' 'intltool')
replaces=('qalculate-gtk')
provides=('qalculate-gtk')
_nick=('qalculate-gtk')
source=("${_nick}-${pkgver}.tar.gz::https://github.com/Qalculate/${_nick}/releases/download/v${pkgver}/${_nick}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_nick}-${pkgver}"
  ./configure --prefix=/usr --without-libgnome || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_nick}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

md5sums=('61065bd9e18e2ee4f48571de7ac7d2f4')
sha1sums=('e5a0e1aa68cf77260d78becc93ab95970dca9434')
