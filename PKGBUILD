pkgname=sadsuite
pkgver=1.1.0
pkgrel=1
pkgdesc="Utilities for Simple Ansi Documents"
arch=('x86_64')
url="https://github.com/FelixEcker/sad"
license=('BSD-3')
depends=('fpc>=3.2.2-5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('d06a2339696f789bd1dca3ae7f832b373a6c66da28c487a74283a628bf2aa438')

build() {
  echo ":: Make sure you have fpc 3.2.2 or newer installed."
  echo ":: compiling sadv"
  cd "sad-$pkgname-$pkgver/sadv"
  sh build.sh

  echo ":: compiling sadhtml"
  cd ../sadhtml
  sh build.sh
}

package() {
  cd "sad-$pkgname-$pkgver"
  install -Dm 755 sadv/out/sadv -t "$pkgdir/usr/bin/"
  install -Dm 755 sadhtml/out/sadhtml -t "$pkgdir/usr/bin/"
}
