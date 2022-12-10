# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.2.1"
pkgrel=1
pkgdesc='a simplistic papermc helper'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums=('f9b3402800c374c5b34042a4985c4a38239a8e7228bb96a127a39001ca70dcec')
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
