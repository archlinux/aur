# Maintainer: Jeff Wright <jeff@teamjk.page>
pkgname=diskonaut
pkgver=0.5.0
pkgrel=1
pkgdesc="TUI disk space navigator written in rust"
arch=('x86_64')
url="https://github.com/imsnif/diskonaut"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('94b7ac6cf8500dddcf0cc3c647c02b05')
