# Maintainer: aksr <aksr at t-com dot me>
pkgname=xfpt
pkgver=0.10
pkgrel=1
epoch=
pkgdesc="A program for turning a simple plain text markup into DocBook XML."
arch=('i686' 'x86_64')
url="http://people.ds.cam.ac.uk/ph10/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
checkdepends=()
provides=('xfpt')
conflicts=('xfpt-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("ftp://ftp.csx.cam.ac.uk/pub/software/wordprocessing/unix/$pkgname/$pkgname-$pkgver.tar.bz2")
noextract=()
options=()
md5sums=('142094238168add3462bab446fbce520')
sha1sums=('f685afa9f1d3be473e23ca529ddc452f1dc87b8c')
sha256sums=('513dd655750d0bd8439c1a77bcfdcd95d0282004d8325834742c2caa658f2656')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/testing"
  ./runtest
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share/xfpt MANDIR=$pkgdir/usr/share/man install
  install -Dm644 doc/xfpt.pdf $pkgdir/usr/share/doc/$pkgname/xfpt.pdf
  install -Dm644 doc/xfpt.html $pkgdir/usr/share/doc/$pkgname/xfpt.html
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

