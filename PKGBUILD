# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=cmfinder
pkgver=0.2
pkgrel=2
pkgdesc='A Covariance Model Based RNA Motif Finding Algorithm'
arch=('i686' 'x86_64')
url="http://bio.cs.washington.edu/yzizhen/CMfinder/"
license=('GPL2')
depends=('perl')
source=("http://bio.cs.washington.edu/yzizhen/CMfinder/CMfinder_$pkgver.tgz")
md5sums=('f4ff2c87b9cb29dc79e56ac30c9c30a5')

build() {
  cd "$srcdir/CMfinder_$pkgver"

  make
}

package() {
  cd "$srcdir/CMfinder_$pkgver"

  install -d "$pkgdir/usr/bin"

  for file in bin/* ; do
    install -Dm755 "$file" "$pkgdir/usr/bin/$(basename "$file")"
  done
}
