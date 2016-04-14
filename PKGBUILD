# Maintainer: Nikita Sivakov <cryptomaniac.512@gmail.com>
# Contributor: Nikita Sivakov <cryptomaniac.512@gmail.com>

pkgname=ucg
_pkglongname=universalcodegrep
pkgver=0.2.2
pkgrel=2
pkgdesc="UniversalCodeGrep (ucg) is an extremely fast grep-like tool specialized for searching large bodies of source code"
arch=(i686 x86_64)
url="https://github.com/gvansickle/ucg"
license=(GPL)
makedepends=("pcre>=8.21" "gcc>=4.8")
provides=(ucg)
conflicts=(ucg-git)
source=(https://github.com/gvansickle/$pkgname/releases/download/$pkgver/$_pkglongname-$pkgver.tar.gz)
sha1sums=('54722fc7bf9e3ef6710bba6416d4b758269c20c1')

build() {
  cd "$srcdir/$_pkglongname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkglongname-$pkgver"
  make DESTDIR="$pkgdir" install
}
