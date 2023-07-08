# Maintainer: Gyorgy Abraham <gyorgy.abraham@protonmail.com>
# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=goose
pkgver=3.13.4
pkgrel=1
pkgdesc='Database migration tool written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/pressly/goose'
license=('MIT')
depends=('go')
makedepends=('git' 'go')
source=("https://github.com/pressly/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b2f19eb4026b1a8a20f57c27ea22715b7721efb4c6a93e2d6a89e4393705d1a9')

build() {
	cd $pkgname-$pkgver
	go build -o goose ./cmd/goose
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 "goose" "${pkgdir}/usr/bin/goose"
}
