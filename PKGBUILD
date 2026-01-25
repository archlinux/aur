# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=sixteen
pkgver=0.8.0
pkgrel=1
pkgdesc="A base16 theme browser"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/sixteen"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25de286ed1929ffef3a46bd9d3ab6069aecebcbac3b292beff65674cc2c1fccb')

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
