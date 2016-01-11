# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Army <uli armbruster google>

pkgname=sst
pkgver=1.0.1
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="The Classic Super Star Trek Game"
url="http://www.almy.us/sst.html"
depends=('glibc')
source=(http://www.almy.us/files/sstsrc.zip)
md5sums=('23f3ba0f3f0d4e9613893691d3040bac')

build() {
  cd "$srcdir/sstsrc"
  # adjust the path of the documentation
  sed 's|"sst.doc"|"/usr/share/doc/sst/sst.doc"|g' -i sst.c
  make
}

package() {
  # binary
  install -Dm755 "$srcdir/sstsrc/sst" "$pkgdir/usr/bin/sst"
  # documentation
  install -Dm644 "$srcdir/sstsrc/sst.doc" "$pkgdir/usr/share/doc/$pkgname/sst.doc"
}
