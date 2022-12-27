# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.8.0"
pkgrel=1
pkgdesc='a simplistic papermc helper'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('7d07805249555d769a42ee0db712d356b6e0d061d34c30bc6f184d94d5a66dc7')
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
