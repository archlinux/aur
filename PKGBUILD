# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

pkgname=ccextractor
pkgver=0.96.4
pkgrel=1
pkgdesc="A closed captions and teletext subtitles extractor for media file."
arch=('x86_64')
url="https://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'ffmpeg' 'gpac' 'tesseract')
makedepends=('clang' 'ffmpeg' 'gpac' 'rust')
source=(
  https://github.com/CCExtractor/ccextractor/releases/download/v$pkgver/ccextractor.$pkgver.tar.gz
)
sha512sums=('62c306b920de53c0a5d617e54af52e7e88e728e3bf9cb572b63938f3424c34c04d63e1609dc906ab17e85c8458bae4f332dc867ed0d1a052e5bcc28d9e2c1462')

build() {
  cd "$srcdir/$pkgname/linux"
  ./build_hardsubx
}

package() {
  cd "$srcdir/$pkgname/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
