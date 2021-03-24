# Maintainer: FixFromDarkness <fixfromdarkness@cock.li>

pkgname=organize-rt
pkgver=1.0.1
pkgrel=1
pkgdesc="Organize file based on regex"
arch=('any')
url="https://gitlab.com/FixFromDarkness/organize-rt"
license=('GPL3')
makedepends=(cargo)
source=("https://gitlab.com/FixFromDarkness/organize-rt/-/archive/$pkgver/organize-rt-$pkgver.tar.gz")
sha256sums=("edb2e4f6b070f4ae41a54444d68e703a043a23ecef4cba292a63d67e7c391160")

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --target-dir=target
}

package() {
	cd $pkgname-$pkgver
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin/"
}

