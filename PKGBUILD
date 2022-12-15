# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.5.0"
pkgrel=1
pkgdesc='a simplistic papermc helper'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('5662a10c3f78d1a1552f6893fd42d6fe4106150a791a5e18de610d472a02c381')
makedepends=('go')
depends=('git' 'pacman')

build () {
  cd "$pkgname-$pkgver"

  export GOFLAGS="-trimpath"
  go build .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
