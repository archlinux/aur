# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.86
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract')
source=(
   https://github.com/CCExtractor/ccextractor/archive/v$pkgver.tar.gz
)
sha512sums=('50a501650f1b60ab54aba690ae211610975bd1894ae103d0a1e10b6348f93436c9fa974a16bff5c7b8ba4e011be1730aa890e3c96217b2a4b05384e598d850d0')

build() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
