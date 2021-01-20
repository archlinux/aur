# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=transfer.sh
pkgver=1.2.1
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
sha256sums=('26e236f6abd97f9dea73d2d36a29a94a1bf5bc26c53679cf726eac5f95e8418c')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
