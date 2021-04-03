# Contributor: navigaid
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname="zkl"
pkgdesc='The zkl programming language'
url='http://www.zenkinetic.com/zkl.html'
license=('custom')
pkgver=1.14.7
pkgrel=2
arch=('x86_64')
depends=('ncurses')
makedepends=('clang')
source=("zkl_vm_src-$pkgver.zip::http://www.zenkinetic.com/Documents/zkl_vm_src.zip")
sha256sums=('9e215092c2f383aaf7b3cd3a9e879317dc08432ad0b9a7fbd6d6bec16bb1f4de')

build() {
  cd "$srcdir"/ZKL/VM
  make zkl
}

package() {
  cd "$srcdir"/ZKL
  install -Dm755 ./Bin/zkl "$pkgdir"/usr/bin/zkl
  install -Dm644 ./VM/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
