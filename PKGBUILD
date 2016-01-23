# Maintainer: aksr <aksr at t-com dot me>
pkgname=aspic
pkgver=1.05
pkgrel=1
epoch=
pkgdesc="A program for turning a textual description of a line drawing into PostScript or Scalable Vector Graphics."
arch=('i686' 'x86_64')
url="http://people.ds.cam.ac.uk/ph10/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=('aspic')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=ChangeLog
source=("ftp://ftp.csx.cam.ac.uk/pub/software/wordprocessing/unix/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('71dab77949d7c6c0920f1e8bfc19e96d')
sha1sums=('d7e83fcd0a0322e2fcb263485b3f82f6bb95e4d9')
sha256sums=('09ca0bbf6fbdf12447988e33bdd259038b9184f1b187e8d3f552cbe9924cb6b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/testing"
  #./RunTests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share/$pkgname MANDIR=$pkgdir/usr/share/man install
  install -Dm644 doc/aspic.pdf $pkgdir/usr/share/doc/$pkgname/aspic.pdf
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

