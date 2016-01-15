# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.79
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://ccextractor.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname.src.$pkgver.zip
)
sha512sums=('bf189b4d203fb772695e634527999ae12ea3159ddcda6fedafc261a912bdb5e3b987a5f437ed1bf43021029639a9342e2e32ef22e992f392b03e7f1b33fb9c84')

build() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
