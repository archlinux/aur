# Maintainer: Unix Sheikh <unixsheikh at protonmail dot com>

pkgname=salahtime-go
pkgver=1.0.1
pkgrel=1
url="https://github.com/unixsheikh/salahtime-go"
pkgdesc="A small command line application written in Go that displays the Islamic prayer times for Europe/Copenhagen"
arch=('any')
license=('The Unlicense')
depends=(
  'pacman>=5.1'
  'sudo'
  'git'
)
makedepends=(
  'go'
)

source=("https://github.com/unixsheikh/salahtime-go/archive/v1.0.1.zip")
md5sums=('96cbb9656c7e59f4c30b8ec9c94e1a2b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o salahtime-go main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "salahtime-go" "$pkgdir/usr/bin/salahtime-go"
}
