# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=transfer.sh
pkgver=1.1.6
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
sha256sums=('3215e37fa614192e569ee99eb2b640aed1bdcc17a65d2850949ec08f2a0aa933')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
