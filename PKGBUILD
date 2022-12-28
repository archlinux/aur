# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.8.2"
pkgrel=1
pkgdesc='a simplistic papermc helper'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('any')
license=('MIT')
sha256sums=('e515cda0c21efb278e9a3b6dd857636b8eaac43d9c45e98855441b4ef81a4924')
makedepends=('go')
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
