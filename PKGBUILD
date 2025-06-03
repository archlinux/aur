# Maintainer: Roberto Alsina <roberto.alsina@gmail.com>
pkgname=sixteen
pkgver=0.5.2
pkgrel=1
pkgdesc="A base16 theme browser"
arch=('x86_64' 'aarch64')
url="https://github.com/ralsina/sixteen"
license=('MIT')
makedepends=('crystal' 'shards')
options=()
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ralsina/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2848a2def03ec3aae0907b2292cf3d4dc8d14fb51dc54b6709cfd8092b1888ce')

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
