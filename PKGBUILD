# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=sixteen
pkgver=0.6.3
pkgrel=1
pkgdesc="A base16 theme browser"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/sixteen"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65ded549cc488de8eaa1dbb575fde7d3e9d922a46ad94cbdd9bc948bc27d09f1')

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
	install -Dm755 bin/${pkgname} $pkgdir/usr/bin/${pkgname}
}
