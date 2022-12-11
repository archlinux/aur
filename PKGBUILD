# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap
pkgver="0.3.2"
pkgrel=1
pkgdesc='a simplistic papermc helper'
url='https://github.com/talwat/pap'
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pap/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums=('86af450b1ba840ce820507086bc3a16d6006fb7c56d49c2d791341bf266656fe')
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
