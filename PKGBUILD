# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=transfer.sh
pkgver=1.3.1
pkgrel=2
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
sha512sums=('728cc46b202e2a4f33c319f19f8426f853539c45d92d656a6486d03272f0eb821f20ccfeb665d61eab3c9c881a7645f58a486562ff75a3c821e860e47ec44ea1')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
