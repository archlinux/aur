# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=3.10.0
pkgrel=1
pkgdesc='GTK+ frontend for libqalculate, without gnome dependencies'
arch=('i686' 'x86_64')
url='http://qalculate.github.io/'
license=('GPL2')
depends=("libqalculate>=${pkgver}" 'gtk3>=3.10')
makedepends=('perl-xml-parser' 'rarian' 'intltool')
replaces=('qalculate-gtk')
provides=('qalculate-gtk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Qalculate/qalculate-gtk/archive/v${pkgver}.tar.gz")
sha256sums=('b7a22a9a70e88a9062d2ab3b232c793a30215bc2d666062e222a52bd2538b86c')

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