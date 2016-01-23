# Maintainer: aksr <aksr at t-com dot me>
pkgname=sdop
pkgver=0.80
pkgrel=1
epoch=
pkgdesc="A typesetting program for turning a subset of DocBook XML into formatted PostScript."
arch=('i686' 'x86_64')
url="http://people.ds.cam.ac.uk/ph10/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=('sdop')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("ftp://ftp.csx.cam.ac.uk/pub/software/wordprocessing/unix/$pkgname/$pkgname-$pkgver.tar.bz2")
noextract=()
options=()
md5sums=('05d76e473f7fc27a873c9b3294b4410a')
sha1sums=('98a2729cbe9cdf917e91a1ea6e65c0297ddfd6f1')
sha256sums=('55fc8e8e5025e4681a2cb696e25cb80b1e2a7e55d01b0f3d9dc57c57351db337')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver/testing"
#  ./runtest
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share/$pkgname MANDIR=$pkgdir/usr/share/man install
  install -Dm644 doc/sdop.pdf $pkgdir/usr/share/doc/$pkgname/sdop.pdf
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

