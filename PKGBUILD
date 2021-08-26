# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=transfer.sh
pkgver=1.3.0
pkgrel=1
pkgdesc='Easy and fast file sharing from the command-line'
arch=('x86_64')
url='https://transfer.sh/'
license=('MIT')
makedepends=('go')
source=("https://github.com/dutchcoders/transfer.sh/archive/v${pkgver}.tar.gz")
sha256sums=('e77122a88339873408700c569834613bda38ec7a810cd98ae488c2edda23c4e3')

build() {
  cd transfer.sh-$pkgver
  go build -v -o transfersh main.go
}

package() {
  cd transfer.sh-$pkgver

  install -Dm755 transfersh "$pkgdir/usr/bin/transfersh"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/transfer.sh/"
}
