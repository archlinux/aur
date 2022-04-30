# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>

pkgname=minised
pkgver=1.16
pkgrel=1
epoch=
pkgdesc="A smaller, cheaper, faster SED implementation."
arch=('i686' 'x86_64')
url="http://www.exactcode.com/site/open_source/minised/"
license=('custom:BSD-like')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://dl.exactcode.de/oss/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
sha256sums=('46e072d5d45c9fd3d5b268523501bbea0ad016232b2d3f366a7aad0b1e7b3f71')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

check() {
  cd $srcdir/$pkgname-$pkgver
  make -k check
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
