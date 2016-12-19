# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.84
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname.src.$pkgver.zip
)
sha512sums=('1d6671c4d42915a61f3fd48ea693d4791048bc052a9859fbe4bdf32e551aa880517f0b6712e7c7588fe49127e491324c1eee9c1a17cb805879d6a03c775480cd')

build() {
  cd "$srcdir/$pkgname/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
