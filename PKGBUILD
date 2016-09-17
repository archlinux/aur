# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgname=xsv
pkgver=0.10.3
pkgrel=1
pkgdesc="A fast CSV toolkit written in Rust"
arch=(i686 x86_64)
url="https://github.com/BurntSushi/xsv"
license=('CUSTOM' MIT)
depends=(gcc-libs)
makedepends=('rust' 'cargo')
source=("https://github.com/BurntSushi/xsv/archive/${pkgver}.tar.gz")
md5sums=('ba2f85ea7543ea0527d84686cb71b95c')


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

