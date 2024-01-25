# Maintainer: André "devkcud" Albanese Junior <patommmmm@proton.me>
pkgname=spurt
pkgver=1.0.0
pkgrel=1
pkgdesc="HTTP stress testing tool that can overload web servers"
arch=("x86_64")
url="https://github.com/zer-far/spurt"
license=("GPL-3.0-only")
makedepends=("go")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zer-far/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("9e6fd5cc6a83027df07f12177921710de3729fb55068a7d20ecd08d1fece558c")

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
