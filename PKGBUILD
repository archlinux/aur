# Maintainer: aksr <aksr at t-com dot me>
pkgname=epix
pkgver=1.2.14
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
md5sums=('3bf176a18a8cac7c128ba47a6cde6f93')
sha1sums=('254c34f3eabc87c0c8c97e43664c76f44b997d8c')
sha256sums=('0f44987455641aedda59c6604a5a3b8c46b6a62afc8051e67436df497270eb06')

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

