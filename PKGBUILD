# Maintainer: Grady Link <aur@grady.link>
pkgname=seec
pkgver=0.11.0
pkgrel=1
pkgdesc="Scratch Everywhere! Extension Compiler"
arch=(any)
url="https://github.com/gradylink/seec"
license=('LGPL-3.0')
makedepends=(go)
source=("https://github.com/gradylink/seec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9298af46e9c6f49c13d151a03098af0aeb55e17552c9f2b3a975e70f544497a1')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w -linkmode=external" -buildmode=pie -mod=readonly -modcacherw
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 seec "$pkgdir"/usr/bin/seec
}
