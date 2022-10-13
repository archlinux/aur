# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=transfer.sh
pkgver=1.4.0
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
b2sums=('80416447dbfd3ad2f0ef966947fb39b2a119094463d2268514e86ca21da8634c1e9359852a7aab6595d43a3ce5f76fdd48056f9f88c08893f02b23ea0b401410')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
