# Maintainer: Stefan Sundin <stefan at stefansundin dot com>
pkgname=aws-rotate-key
pkgver=1.2.0
pkgrel=1
pkgdesc="Easily rotate your AWS access key. 🔑"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/stefansundin/aws-rotate-key"
license=('MIT')
depends=()
makedepends=(go)

source=("https://github.com/stefansundin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('91568ad7aeb849454ac066c44303e2b97e158dc094a90af43c8c9b3dc5cc4ed7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags='-s -w' -trimpath
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 aws-rotate-key "${pkgdir}/usr/bin/aws-rotate-key"
}
