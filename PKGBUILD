# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=retrovol
pkgver=0.14
pkgrel=2
pkgdesc="A sound volume mixer"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://puppylinux.svn.sourceforge.net/viewvc/puppylinux/retrovol/"
groups=()
depends=('gtk2' 'alsa-lib')
makedepends=()
optdepends=()
options=()
install=
source=("http://www.browserloadofcoolness.com/software/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e92997c2be0049b0d768ba6a228e1737')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
