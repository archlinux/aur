# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=sixteen
pkgver=0.3.1
pkgrel=1
pkgdesc="A base16 theme browser"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/sixteen"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("6ed21b3f62de8af15876ade8f705303ac145b2effbf0bd80e1a96ecbbf5ea925")

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
