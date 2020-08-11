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
source=('git+https://github.com/pressly/goose.git')
sha256sums=('SKIP')

build() {
	cd goose
	git checkout v2.6.0
	go get ./...
	go build -i -o goose ./cmd/goose	
}

package() {
	cd goose
	install -Dm755 "goose" "${pkgdir}/usr/bin/awstail"
}
