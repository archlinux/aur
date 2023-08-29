# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=transfer.sh
pkgver=1.6.0
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
b2sums=('afb744abcd7888304d32d440fd212bccfd24789e14a879d80cb43988bcd52c785917659079ef883de1af158064ec2cb7d99fadc917df81a717574f0ab04e0ea9')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
