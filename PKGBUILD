# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=transfer.sh
pkgver=1.6.1
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
b2sums=('80fd76f52d0240c0dc27521a75f07b69855317ca13299831c83682d3a368bc796b09121ab0e2f05a18c92734f4341a1277cd02801f3626ef9bbca503fe095c5e')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
