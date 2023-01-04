# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-broker
pkgver=0.0.9
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (broker)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=()
makedepends=('go')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("9285edb203c8facef658f1cb8eb0c4f4")

build() {
	cd "youmu-thlink-$pkgver"

	go build -o ./build/thlink-broker ./broker/
}

package() {
	cd "youmu-thlink-$pkgver"

	install -Dm755 ./build/thlink-broker $pkgdir/usr/bin/thlink-broker
}

