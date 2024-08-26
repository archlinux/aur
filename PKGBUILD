# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=markterm
pkgver=0.3.1
pkgrel=1
pkgdesc="A terminal markdown renderer."
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/markterm"
license=('MIT')
makedepends=('crystal' 'shards')
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("5f1e354ab11b29990bbcf906cf4f9cd3b15a9b7c338ffa73c90c28b56b5eab82")

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	shards install
	shards build --release
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 bin/$pkgname $pkgdir/usr/bin/$pkgname
}
