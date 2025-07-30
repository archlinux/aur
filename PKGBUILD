# Maintainer: Yujon Pradhananga <yujonpradhananga@gmail.com>
pkgname=invoker-trainer
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI trainer for Invoker"
arch=('x86_64')
url="https://github.com/Yujonpradhananga/invoker-trainer"
license=('MIT')  # adjust accordingly
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yujonpradhananga/invoker-trainer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # or specify the real hash

build() {
  cd "$srcdir"/invoker-trainer-$pkgver
  export GO111MODULE=on
  go build -o "$pkgname"
}

package() {
  cd "$srcdir"/invoker-trainer-$pkgver
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
