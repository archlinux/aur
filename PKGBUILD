# Maintainer: aksr <aksr at t-com dot me>
pkgname=xfpt
pkgver=0.09
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
md5sums=('35ba1521dc89e68600456ff598463b4f')
sha1sums=('f556d54b9e4491dedcb5ece7b45244b13c09cce1')
sha256sums=('ecb3f10b8c5bc8c7b53325fbe1de0b1e6990da11335d4a217dccca5fac97f492')

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

