# Maintainer: Gyorgy Abraham <gyorgy.abraham@protonmail.com>
# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=goose
pkgver=3.15.0
pkgrel=1
pkgdesc='Database migration tool written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/pressly/goose'
license=('MIT')
depends=('go')
makedepends=('git' 'go')
source=("https://github.com/pressly/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f301fdd7df5d05c6c1f8eb358f8aaa8177afb7e5d28064586cdf00bd6e5677ec')

build() {
	cd $pkgname-$pkgver
	go build -o goose ./cmd/goose
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 "goose" "${pkgdir}/usr/bin/goose"
}
