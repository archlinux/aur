# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=4.7.0
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
sha256sums=('1a04e8d14288924e7cbb2978582f2ae34f2f7269a84b3972d973a93c657df19e')

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
