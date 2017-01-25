# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.85
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname-src-nowin.$pkgver.zip
)
sha512sums=('53adc017b7b1679302677e3773aabdcceddabdd8a6550cf8b9fb98150b7323a1cc6dbe67a48ebcdf22a4d013c00831907799032dd0f7f6f06943252be8177cec')

build() {
  cd "$srcdir/$pkgname/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
