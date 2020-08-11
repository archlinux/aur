# Maintainer: Gyorgy Abraham <gyorgy.abraham@protonmail.com>
pkgname=goose
pkgver=2.6.0
pkgrel=1
pkgdesc='Database migration tool written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/pressly/goose'
license=('MIT')
depends=('go')
makedepends=('git' 'go')
source=("https://github.com/pressly/$pkgname/archive/v$pkgver.tar.gz")
noextract=("v$pkgver.tar.gz")
sha256sums=('389953f40e567fd92090fd29d60e1baec576e6432e689f11ef54e6493502383a')

build() {
	tar -xzf v$pkgver.tar.gz
	cd $pkgname-$pkgver
	go get ./... || true
	go build -i -o goose ./cmd/goose	
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 "goose" "${pkgdir}/usr/bin/goose"
}
