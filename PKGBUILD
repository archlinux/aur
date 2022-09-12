# Maintainer : kdx <kikoodx@paranoici.org>

pkgname=libdx
pkgver=0.1.3
pkgrel=1
pkgdesc='Small C functions library.'
arch=(x86_64)
url="https://git.sr.ht/~kikoodx/$pkgname"
license=('custom:0BSD')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-v$pkgver"
  make
}

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
