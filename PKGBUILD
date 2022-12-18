# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.5.2"
pkgrel=1
pkgdesc='a simplistic papermc helper'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('7f4fd6dae8a7b1208b020f9ee461bd3caec7c364125cc07ea54ef6eaaabdea9d')
makedepends=('go')
depends=('pacman')
optdepends=('java-runtime: running the downloaded jarfiles')

build () {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-trimpath"
  go build .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
