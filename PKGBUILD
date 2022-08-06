#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xsm
_pkgname=xsm
pkgdesc="X Session Manager"
pkgver=1.0.5
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxaw' 'xorg-smproxy' 'xorg-iceauth' 'xorg-rstart')
optdepends=('xorg-twm: for window manager in default scripts')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('bf391a986cd7a12c8e1c5b1b96791a0a')
