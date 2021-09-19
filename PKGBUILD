pkgname=htmlq
pkgdesc='Like jq, but for HTML.'
pkgver=0.3.0
pkgrel=1
arch=(x86_64)
license=(MIT)
depends=(gcc-libs)
makedepends=(git cargo)
source=("https://github.com/mgdm/htmlq/archive/refs/tags/v0.3.0.tar.gz")
md5sums=('09c547afeb10e663e212f5d9c5298c1f')

build() {
	cd "htmlq-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "htmlq-$pkgver"
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
