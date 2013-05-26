# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=retrovol
pkgver=0.13.1
pkgrel=1
pkgdesc="An sound volume mixer"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://puppylinux.svn.sourceforge.net/viewvc/puppylinux/retrovol/"
groups=()
depends=('gtk2' 'alsa-lib')
makedepends=()
optdepends=()
options=()
install=
source=(http://www.browserloadofcoolness.com/software/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('7a8eccb09ebf55544fcb88b875120a81')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
