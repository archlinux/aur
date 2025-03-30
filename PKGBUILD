# Maintainer: x45iq <44chet44chet44@gmail.com>
pkgname=ccode
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to consolidate code files into a single output"
arch=('x86_64' 'aarch64')
url="https://github.com/x45iq/ccode"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/x45iq/ccode/archive/v$pkgver.tar.gz")
sha256sums=('f3cc23c84c7358ad0a03ecb3d64e3889114788d55d2523bc9f5fb81f38526560')

build() {
  cd "$pkgname-$pkgver"
  go build -o ccode ./cmd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 ccode "$pkgdir/usr/bin/ccode"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}