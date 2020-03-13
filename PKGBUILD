# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=transfer.sh
pkgver=1.1.3
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
sha256sums=('116a4790aba2d035ffe81efbf0ba894543576de5c1734a8f2495d9811ab1086a')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
