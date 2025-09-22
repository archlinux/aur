# Maintainer: core6quad <core6quad@gmail.com>
pkgname=makepass
pkgver=0.2.0
pkgrel=1
pkgdesc="Yet another password generator written in Go."
arch=('x86_64')
url="https://github.com/core6quad/makepass"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c975c38522c156235a101a92caf93a2c5a4129d1e0191d90711882f7effb4d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o makepass main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
