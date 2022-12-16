# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-client
pkgver=0.0.8
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (client)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=()
makedepends=('go')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("a1d0918f5c4de2341bf4b369bf2961f6")

build() {
	cd "youmu-thlink-$pkgver"

	go build -o ./build/thlink-client ./client/
}

package() {
	cd "youmu-thlink-$pkgver"

	install -Dm755 ./build/thlink-client $pkgdir/usr/bin/thlink-client
}

