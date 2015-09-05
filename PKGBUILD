# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgname=xsv
pkgver=0.9.8
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
url="https://github.com/BurntSushi/xsv"
license=('CUSTOM')
depends=(gcc-libs)
makedepends=('rust' 'cargo')
source=("https://github.com/BurntSushi/xsv/archive/${pkgver}.tar.gz")
md5sums=('528ebe539ce099efec6b06d420f8deba')


build() {
	cd "$srcdir/xsv-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/xsv-${pkgver}"
	install -m755 -D target/release/xsv "$pkgdir/usr/bin/xsv"
	install -D -m644 "UNLICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

