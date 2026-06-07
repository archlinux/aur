# Maintainer: Grady Link <aur@grady.link>
pkgname=seec
pkgver=0.11.2
pkgrel=1
pkgdesc="Scratch Everywhere! Extension Compiler"
arch=(any)
url="https://github.com/gradylink/seec"
license=('LGPL-3.0')
makedepends=(go)
source=("https://github.com/gradylink/seec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71fd0a911c3020695ec20b91e201837ad7ef7ee274e8f7f137e6e340b71b22d1')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w -linkmode=external" -buildmode=pie -mod=readonly -modcacherw
}

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 seec "$pkgdir"/usr/bin/seec
}
