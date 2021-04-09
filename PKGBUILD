pkgname=htmlq
pkgdesc='Like jq, but for HTML.'
pkgver=0.1.1
pkgrel=1
arch=(x86_64)
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("git+https://github.com/mgdm/htmlq.git#commit=0cb3b72")
md5sums=('SKIP')

build() {
	cd htmlq
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd htmlq
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
