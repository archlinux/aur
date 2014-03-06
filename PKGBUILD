# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=evd-git
pkgver=20140125
pkgrel=1
pkgdesc="eventdance, a peer-to-peer inter-process communication library."
arch=(i686 x86_64)
url='https://github.com/elima/eventdance'
license=('LGPL')
depends=(json-glib libsoup)
optdepends=('gtkdocise: generating api docs')
source=('git+https://github.com/elima/EventDance')
provides=('evd')
makedepends=('git')
sha256sums=('SKIP')


build() {
  cd "${srcdir}"/EventDance

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/EventDance
  make DESTDIR="${pkgdir}/" install
}

pkgver() {
  date '+%Y%m%d'
}
