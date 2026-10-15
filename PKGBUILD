# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>

pkgname=watcher
pkgver=0.14.5
pkgrel=1
pkgdesc="Simple and efficient filesystem watcher"
arch=('x86_64')
url="https://github.com/e-dant/watcher"
license=('MIT')
depends=()
makedepends=('cmake' 'ninja' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('190bbe5e19923083db2beb3aa68f4e99a563c8f685d8037b0536780b0116c4d3')

# I'm doing things exactly like fcitx5-rime here
build() {
	cd "$pkgname-$pkgver"
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
	ninja
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja install
}
