# Maintainer: Adam Harvey <adam@adamharvey.name>

pkgname=gpup
pkgver=1.6.1
pkgrel=1
pkgdesc='A command to upload photos and movies to your Google Photos Library'
arch=('x86_64')
url="https://github.com/int128/gpup"
license=('Apache')
makedepends=('go-pie')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c36490c8ecb0f1b68d4e5947a45a03398f376d666f8037e6be43dd7bf95f901d')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
