# Maintainer: aksr <aksr at t-com dot me>
pkgname=epix
pkgver=1.2.16
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
md5sums=('08b37229f99d35e1e74ceb71cba48909')
sha1sums=('83789be6c1fd746715c3daf7d66d49bb81f0b373')
sha256sums=('641ad4cd04c9f9a18477b303ebb06c418fdb96c04fc81b3f06e6cb0ad81953ec')

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

