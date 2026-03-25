# Contributor: Nicolas Quiénot < niQo at aur >

pkgname=frame
pkgver=2.5.0
pkgrel=2
pkgdesc="Frame handles the buildup and synchronization of a set of simultaneous touches."
arch=(i686 x86_64)
url="https://launchpad.net/frame"
license=(GPL)
depends=('libxi' 'gcc-libs')
makedepends=('xorg-server-devel' 'asciidoc')
provides=('utouch-frame')
conflicts=('utouch-frame')
replaces=('utouch-frame')
options=('!libtool')
source=(https://deb.debian.org/debian/pool/main/f/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz)
md5sums=('f523283e80a1de613bd38e3b7f0c5f8e')



build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

