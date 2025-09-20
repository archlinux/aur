# Maintainer: Grady Link <aur@grady.link>
pkgname=seec
pkgver=0.5.0
pkgrel=1
pkgdesc="Scratch Everywhere! Extension Compiler"
arch=(any)
url="https://github.com/gradylink/seec"
license=('LGPL-3.0')
makedepends=(go)
source=("https://github.com/gradylink/seec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e13144c1a9a8dc06c7f97f41f3be807abc1d005f53306c2b021486b648b43548')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w -linkmode=external" -buildmode=pie -mod=readonly -modcacherw
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 seec "$pkgdir"/usr/bin/seec
}
