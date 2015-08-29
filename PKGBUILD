# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Marek Skrobacki <skrobul@skrobul.com>

pkgname=input-utils
pkgver=1.1
pkgrel=1
pkgdesc="Equivalent of Ubuntu/Debian's input-utils. Contains lsinput"
url="http://www.kraxel.org/releases/input/"
arch=('x86_64' 'i686')
license=('GPLv2')
source=("http://www.kraxel.org/releases/input/input-$pkgver.tar.gz")
sha256sums=('544636fb0d468cae7de502f7b973a54a3195073328b235b906bd21298694b65b')

build() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/input-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
