# Maintainer: Kenichi Takahashi <kenichi.taka@gmail.com>

pkgname=frgm
pkgver=0.11.0
pkgrel=1
pkgdesc='meta snippet(fragment) manager'
arch=('x86_64')
url="https://github.com/k1LoW/$pkgname"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d575c004034dd93bd67215ef07dd65f679ba313c3459b1826ff70041ff61890a')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  go build -o build 
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/frgm/LICENSE"
}
