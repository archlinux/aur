# Maintainer: Stefan Sundin <stefan at stefansundin dot com>
pkgname=aws-rotate-key
pkgver=1.1.0
pkgrel=1
pkgdesc="Easily rotate your AWS access key. 🔑"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/stefansundin/aws-rotate-key"
license=('MIT')
depends=()
makedepends=(go)

source=("https://github.com/stefansundin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0ecb4830dde426702629430889a8bcd4acddae9aab2d8f03ddab6514a3f966ef')

build() {
  cd "$srcdir/$pkgname"
  go build -ldflags='-s -w' -trimpath
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 aws-rotate-key "${pkgdir}/usr/bin/aws-rotate-key"
}
