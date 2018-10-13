# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgname=xsv
pkgver=0.13.0
pkgrel=1
pkgdesc="A fast CSV toolkit written in Rust"
arch=(i686 x86_64)
url="https://github.com/BurntSushi/xsv"
license=('CUSTOM' MIT)
depends=(gcc-libs)
makedepends=('rust' 'cargo')
source=("https://github.com/BurntSushi/xsv/archive/${pkgver}.tar.gz")
md5sums=('9d61bd38c7c7ec67005832f5dc6d9ee2')


build() {
	cd "$srcdir/xsv-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/xsv-${pkgver}"
	install -m755 -D target/release/xsv "$pkgdir/usr/bin/xsv"
	install -D -m644 "UNLICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
	install -D -m644 "LICENSE-MIT" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

