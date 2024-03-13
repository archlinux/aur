# Maintainer: Gyorgy Abraham <gyorgy.abraham@protonmail.com>
# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=goose
pkgver=3.19.2
pkgrel=1
pkgdesc='Database migration tool written in Go.'
arch=('i686' 'x86_64')
url='https://github.com/pressly/goose'
license=('MIT')
depends=('go')
makedepends=('git' 'go')
source=("https://github.com/pressly/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a3ddcb2f128470cbd6b1dc1bfea119c69ffceb9deaee40a5a5229db94938a68f')

build() {
	cd $pkgname-$pkgver
	go build -o goose ./cmd/goose
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 "goose" "${pkgdir}/usr/bin/goose"
}
