# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.78
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://ccextractor.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname.src.$pkgver.zip
)
sha512sums=('e3d672d3736b38f4fce7f4e22684efc1efeb1af6d168ef0ee58bd3dc910a66095d89755fbb2fa83a9608e487890f5079e9b9a9f80435511904ba00e28d7ea2e1')

build() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
