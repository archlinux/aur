# Maintainer: Grady Link <aur@grady.link>
pkgname=seec
pkgver=0.8.2
pkgrel=1
pkgdesc="Scratch Everywhere! Extension Compiler"
arch=(any)
url="https://github.com/gradylink/seec"
license=('LGPL-3.0')
makedepends=(go)
source=("https://github.com/gradylink/seec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12ed08af654f0d0bb014b68ef48ed6b856b28d1111389d894bce8388a2408eda')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w -linkmode=external" -buildmode=pie -mod=readonly -modcacherw
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 seec "$pkgdir"/usr/bin/seec
}
