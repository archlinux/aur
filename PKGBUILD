# Maintainer: Adam Cihelka <haziness_droop794@slmail.me>

pkgname=gowatch
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple terminal stopwatch, written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/buxxket/gowatch"
license=('GPL3')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buxxket/gowatch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d870cd9dedfeb35f4471be4112945ffe618f8cdf547d9ea4ab7c3e462f508be9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o gowatch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gowatch "$pkgdir/usr/bin/gowatch"
  if [[ -f config.yaml.default ]]; then
    install -Dm644 config.yaml.default "$pkgdir/usr/share/$pkgname/config.yaml"
  fi
}
