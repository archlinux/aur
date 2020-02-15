# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=3.7.0
pkgrel=1
pkgdesc='GTK+ frontend for libqalculate, without gnome dependencies'
arch=('i686' 'x86_64')
url='http://qalculate.github.io/'
license=('GPL')
depends=("libqalculate>=${pkgver}" 'gtk3>=3.10' 'cln>=1.2.0')
makedepends=('perl-xml-parser' 'rarian' 'intltool')
replaces=('qalculate-gtk')
provides=('qalculate-gtk')
source=("https://github.com/Qalculate/qalculate-gtk/archive/v${pkgver}.tar.gz")
md5sums=('a6b42fc6c4739545d2a39ecef89c6a42')

build() {
  cd "${srcdir}/qalculate-gtk-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --without-libgnome
  make
}

package() {
  cd "${srcdir}/qalculate-gtk-${pkgver}"
  make DESTDIR="${pkgdir}" install
}