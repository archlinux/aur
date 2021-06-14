# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

pkgname=ccextractor
pkgver=0.89
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="https://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract' 'leptonica' 'ffmpeg')
source=(
   https://github.com/CCExtractor/ccextractor/archive/v$pkgver.tar.gz
)
sha512sums=('4c0ede441807df4b7ec1818489eeea9b317c79b4589c9db853edc7d23ead841f9a8fd5aa53a48f16080ee4c2bfb52c915aa482a79b91020fb45ee2533fe53a2c')

build() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  ./build_hardsubx
}

package() {
  cd "$srcdir/$pkgname-$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
