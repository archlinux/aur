# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Patrick Leslie Polzer <polzer@gnu.org>
# Contributor: J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar>

pkgname=qalculate-gtk-nognome
pkgver=3.14.0
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
sha256sums=('94dbcfaa6e43cfb5a401a6f58ceea743725ebf241665360529c61488595d846a')

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
