# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=lexicmap
pkgver=0.10.0
pkgrel=1
pkgdesc="Efficient sequence alignment against millions of prokaryotic and viral genomes"
arch=('x86_64')
url="https://github.com/shenwei356/LexicMap"
license=('MIT')
makedepends=('go')
conflicts=('lexicmap-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4cb01f13d7ad964a8c0bf864f4d55ffe6f0292f4b99732dba1207deb3706ff33')

build() {
  cd "$srcdir/LexicMap-$pkgver"
  go build -trimpath -buildvcs=false -o "$srcdir/$pkgname" "./$pkgname"
}

package() {
  cd "$srcdir/LexicMap-$pkgver"
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
