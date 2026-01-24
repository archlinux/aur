# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

pkgname=ccextractor
pkgver=0.96.5
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
sha512sums=('e55be913197811ee7c1a619893439a327039bf874f2aee72a082a512868a966b93f65810f45c72714036d285216c0aacf4c85e71a6ff2d8976fcb8cf54d6efef')

build() {
  cd "$srcdir/$pkgname/linux"
  ./build_hardsubx
}

package() {
  cd "$srcdir/$pkgname/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
