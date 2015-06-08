# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: for Arch and Chakra: msx <msx "at" archlinux {dot} us>

pkgname=kdeplasma-applets-calendarevent
pkgver=0.4.1
pkgrel=1
pkgdesc="A plasmoid displaying the days of the calendar in one column."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/CalendarEvent?content=148928"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4' 'boost')
conflicts=('kdeplasma-addons-applets-calendarevent')
replaces=('kdeplasma-addons-applets-calendarevent')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/148928-calendarevent-${pkgver}.tar.gz")
sha256sums=('1d847dcc875f475d1d74ffc08b8a0ddb952999b8ce2eed0398149044d89adabe')
install=${pkgname}.install

build() {
  cd "${srcdir}/calendarevent"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make
}

package() {
  cd "${srcdir}/calendarevent/build"
  make DESTDIR="${pkgdir}/" install
}
