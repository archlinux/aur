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
md5sums=('87301bc87b5a06e525f228d073428895')

prepare() {
  cd "$srcdir"
  # adjust the path of the documentation
  sed 's|"sst.doc"|"/usr/share/doc/sst/sst.doc"|g' -i sst.c
}

build() {
  cd "$srcdir"
  make
}

package() {
  # binary
  install -Dm755 "$srcdir/sst" "$pkgdir/usr/bin/sst"
  # documentation
  install -Dm644 "$srcdir/sst.doc" "$pkgdir/usr/share/doc/$pkgname/sst.doc"
}
