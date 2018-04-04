# Maintainer: aksr <aksr at t-com dot me>
pkgname=epix
pkgver=1.2.18
pkgrel=1
epoch=
pkgdesc="ePiX - Utilities for creating mathematically accurate figures"
arch=('i686' 'x86_64')
url="http://mathcs.holycross.edu/~ahwang/epix/ePiX.html"
license=('GPL')
groups=()
depends=('ghostscript' 'texlive-latexextra' 'texlive-pictures' 'texlive-pstricks')
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
source=("http://mathcs.holycross.edu/~ahwang/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('313808af7f50cfde5dc684eff0623151')
sha1sums=('5b67581464db0fd494da0ac3865912eff6c9ef9c')
sha256sums=('ef2a6ecabc4a5beb7e4460e9dcea79e515d54298981bc9ecb6efa3c2c41f934d')

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
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

