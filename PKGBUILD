# Maintainer: Grady Link <aur@grady.link>
pkgname=seec
pkgver=0.8.0
pkgrel=1
pkgdesc="Scratch Everywhere! Extension Compiler"
arch=(any)
url="https://github.com/gradylink/seec"
license=('LGPL-3.0')
makedepends=(go)
source=("https://github.com/gradylink/seec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8aad1da22afa82e7887458e87e88db971c9d4f3702014690c8f78d893ac16623')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w -linkmode=external" -buildmode=pie -mod=readonly -modcacherw
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 seec "$pkgdir"/usr/bin/seec
}
