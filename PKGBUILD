# Maintainer: aksr <aksr at t-com dot me>
pkgname=shellsupport
pkgver=2.3.5
pkgrel=1
epoch=
pkgdesc="A commandline C program, supports (bourne) shell scripting."
arch=('i686' 'x86_64')
url="http://www.cons.org/cracauer/shellsupport.html"
license=('unknown')
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
source=("http://www.cons.org/cracauer/download/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('713950c66f4526d16fc011af017ad794')
sha1sums=('a358d752766ab794a741e188d4e60641f6a280f5')
sha256sums=('b500fd47acc614eba29a83f0183083c787e8091c6a6c194a431e15a36df9f0bd')

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

