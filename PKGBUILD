# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.88
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract')
source=(
   https://github.com/CCExtractor/ccextractor/archive/v$pkgver.tar.gz
)
sha512sums=('bb9442905f3c5d095b9b34eb318dc445a0ba484c22c4f061071cc2a1159ec9304b8aab5ea9e95348679e8c5ed378d4b2e471d6f7f933b7fa968f3443f1d5380f')

build() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
