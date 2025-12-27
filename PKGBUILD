# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

pkgname=ccextractor
pkgver=0.96.2
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
sha512sums=('94bc894284b79959c57d6a3566fda1ec1267d0c9948a62f2f1ebdf57be858beeb7221519c9dc56efb4bb92e509cd0f0c8557e5b84195a4e6465d4f19aca70bbd')

build() {
  cd "$srcdir/$pkgname/linux"
  ./build_hardsubx
}

package() {
  cd "$srcdir/$pkgname/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
