# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>

pkgname=ttf2png
pkgver=1.0
pkgrel=2
pkgdesc="Create a PNG image containing a set of glyphs from a true type font."
arch=('i686' 'x86_64')
url="http://www.tdb.fi/ttf2png.shtml"
license=('GPL')
depends=('freetype2' 'libpng')
makedepends=()
options=()
source=("http://www.tdb.fi/files/$pkgname-$pkgver.tar.gz"
        "Makefile.patch")
md5sums=('2e67e3745cbf567f7f2317a5bfc3fee3'
         '1f93dd6955fa2803f6e503771099c432')
sha256sums=('435d4ec2f71be8bd75787fb0f449ebc92645bcd61f6bc1826ad06673f95f4703'
            'af392a83057c1cb3696e35672ccbb80cb2d36f49e898a0bb167db958db02e64b')

prepare() {
  patch "$srcdir/$pkgname-$pkgver/Makefile" "$srcdir/Makefile.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/doc/$pkgname

  cd "$srcdir/$pkgname-$pkgver"
  
  install -D -m 755 ttf2png $pkgdir/usr/bin
  install -D -m 644 Readme $pkgdir/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
