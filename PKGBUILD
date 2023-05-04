# Maintainer: Gyorgy Abraham <gyorgy.abraham@protonmail.com>
# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=goose
pkgver=3.11.0
pkgrel=1
pkgdesc='Database migration tool written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/pressly/goose'
license=('MIT')
depends=('go')
makedepends=('git' 'go')
source=("https://github.com/pressly/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7e0cb6863db15c04d8b25d9414516314181a533f04152ec9e63c55d5bf65ca8a')

build() {
	cd $pkgname-$pkgver
	go build -o goose ./cmd/goose
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 "goose" "${pkgdir}/usr/bin/goose"
}
