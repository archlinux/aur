# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=openfaas-cli
pkgdesc="OpenFaaS CLI"
pkgver=0.4.18
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('9350c345484ba217645af1e75487725159d2eceff21518265b751f05f7083f4e')

build() {
  cd "$srcdir/faas-cli-$pkgver"
  go build -o faas-cli .
}

package() {
  install -Dm 755 "$srcdir/faas-cli-$pkgver/faas-cli" "$pkgdir/usr/bin/faas-cli"
}
