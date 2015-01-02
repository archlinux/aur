# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=retrovol
pkgver=0.14.1
pkgrel=1
pkgdesc="A sound volume mixer"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="https://github.com/pizzasgood/retrovol"
depends=('gtk2' 'alsa-lib')
makedepends=('git')
source=("$pkgname::git+https://github.com/pizzasgood/retrovol.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd $pkgname
  autoreconf -fiv
}
build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
