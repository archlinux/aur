pkgname=pijul
pkgver=0.11.0
pkgrel=1
pkgdesc="Patch-based distributed version control system"
url='https://pijul.org'
makedepends=('cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64')
license=('GPL')
source=("${url}/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e60793ab124e9054c1d5509698acbae507ebb2fab5364d964067bc9ae8b6b5e5')

build() {
  cd $srcdir/"$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd $srcdir/"$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
