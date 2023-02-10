# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-client
pkgver=0.0.12
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (client)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=()
makedepends=('go' 'zlib')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("f0d03166d043db781e348fc8e47ddf86")

build() {
	cd "youmu-thlink-$pkgver"

	go build -o ./build/thlink-client ./client/
}

package() {
	cd "youmu-thlink-$pkgver"

	install -Dm755 ./build/thlink-client $pkgdir/usr/bin/thlink-client
}

