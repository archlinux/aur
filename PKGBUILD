# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.87
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract')
source=(
   https://github.com/CCExtractor/ccextractor/archive/v$pkgver.tar.gz
)
sha512sums=('adc421dadc844c5708bd8a15d07bca9cece8d381515a5a2f7ebaca1b95a128d083de6a6cfaa695a89dc3bcb81e0e457a959be072a9b1cd2c268a5138a93a0a11')

build() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
