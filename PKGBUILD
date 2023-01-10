# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-client
pkgver=0.0.10
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (client)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=()
makedepends=('go')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("cf9b74f54d2b8237295e2b056d16c1ec")

build() {
	cd "youmu-thlink-$pkgver"

	go build -o ./build/thlink-client ./client/
}

package() {
	cd "youmu-thlink-$pkgver"

	install -Dm755 ./build/thlink-client $pkgdir/usr/bin/thlink-client
}

