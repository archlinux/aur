# Maintainer: Lukas Sabota <LTsmooth __at__ gmail _dot_ com>
pkgname=libiriverdb
pkgver=1.6
pkgrel=1
epoch=
pkgdesc="A small C library to handle database creation on iriver H100/H300 devices."
arch=('i686' 'x86_64')
url="http://bodgitandscarper.co.uk/libiriverdb/"
license=('GPL')
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
source=(http://libiriverdb.s3.amazonaws.com/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('9da37e9d54bd136ef4470b271f64c4e3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
