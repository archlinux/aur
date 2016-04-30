# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.80
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://ccextractor.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname.src.$pkgver.zip
)
sha512sums=('595f697d8c3ae89bcc33128f4b507940a649b673ab2c21518428b2c63b57265b2135122d890820d82593acab61d2371f14b6c13c31bfeeeeae580bdcc9b7d620')

build() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
