# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-client
pkgver=0.0.11
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (client)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=()
makedepends=('go')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("7d6d2d7f9f2193f065757209fa3f316f")

build() {
	cd "youmu-thlink-$pkgver"

	go build -o ./build/thlink-client ./client/
}

package() {
	cd "youmu-thlink-$pkgver"

	install -Dm755 ./build/thlink-client $pkgdir/usr/bin/thlink-client
}

