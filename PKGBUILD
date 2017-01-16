# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Marek Skrobacki <skrobul@skrobul.com>

pkgname=input-utils
pkgver=1.2
pkgrel=1
pkgdesc="Equivalent of Ubuntu/Debian's input-utils. Contains lsinput"
url="http://www.kraxel.org/releases/input/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("http://www.kraxel.org/releases/input/input-$pkgver.tar.gz")
sha256sums=('7934244f34d5cd5d31a67d14892d4c0d8260dc0f622e01cf21bc1eddf4b98b56')

build() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
