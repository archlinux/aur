# Maintainer: aksr <aksr at t-com dot me>
pkgname=deroff
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="Removes roff constructs, knows about certain -man and -mm macros, is able to generate a word list or omit headers"
arch=('i686' 'x86_64')
url="http://www.moria.de/~michael/deroff/"
license=('GPL')
categories=()
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.moria.de/~michael/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('dcc4ce030ca719a36f34b01c8afebfda')
sha1sums=('8768a21a73069253c687b9a8e92b32aa76ccc88f')
sha256sums=('e04a91b8311f269683ae881ebb14fe824b3e01c875ef9f469882b5be3de36970')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr/" MANDIR="$pkgdir/usr/share/man" install
}

