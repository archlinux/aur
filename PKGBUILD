# Maintainer : Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

# Current source for PKGBUILD can be found at
# https://github.com/cacack/pkgbuilds/tree/master/ccextractor

pkgname=ccextractor
pkgver=0.81
pkgrel=1
pkgdesc="A fast closed captions extractor for MPEG files."
arch=('i686' 'x86_64')
url="http://ccextractor.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(
   http://downloads.sourceforge.net/ccextractor/$pkgname.src.$pkgver.zip
)
sha512sums=('0a379cdab51f15404d01eb00096266a5cd8a8f9d178b29ee194dc8153cbbf68ff947db6410fca3675717fbb29631e9b8c01137082fa3c0335d636769cb6ba324')

build() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  ./build
}

package() {
  cd "$srcdir/$pkgname.$pkgver/linux"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
