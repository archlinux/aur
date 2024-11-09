# Maintainer: codewithsarthak <codewithsarthak@proton.me>
pkgname=griptail
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight system information display tool"
arch=('x86_64')
url="https://github.com/codiwithsarthak/griptail"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')

source=("$pkgname-$pkgver.tar.gz::https://github.com/codiwithsarthak/griptail/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace SKIP with actual checksum after downloading

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm755 griptail "$pkgdir/usr/bin/griptail"

  # Install license if present
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  # Install documentation if present
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
