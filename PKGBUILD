# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

pkgname=ccextractor
pkgver=0.91
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="https://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract' 'leptonica' 'ffmpeg')
source=(
   https://github.com/CCExtractor/ccextractor/archive/v$pkgver.tar.gz
)
sha512sums=('4b30dc92d3ad97d81b43478162ab9327addc1807f502b06fd62683560a46224094eb9f60e925e4e0d1089d430534f8b1e6334ff733d393815b4e5d89e6811a55')

build() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  ./build_hardsubx
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
