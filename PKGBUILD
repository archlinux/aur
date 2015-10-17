# Maintainer: aksr <aksr at t-com dot me>
pkgname=epix
pkgver=1.2.15
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
md5sums=('0774f64cb51b1eeeb18aa29fb95ad087')
sha1sums=('66d106b559af5ab21f4413a12e3fe799dc7d1277')
sha256sums=('9170278aeeec444e0b13f3d47d072daa9d855e1bcb6d5ad2fe0dc624f2f536cf')

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

