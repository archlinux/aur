# Maintainer: Samuel Laurén <samuel.lauren@iki.fi>
pkgname=run-or-raise
pkgver=0.3.3
pkgrel=1
pkgdesc="Utility for launching applications or focusing their windows"
arch=("x86_64")
url="https://github.com/Soft/run-or-raise"
license=("GPL3")
depends=("libxcb")
makedepends=("rust" "cargo" "python")
source=("https://github.com/Soft/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7fc809f0b75ba52b62d10d2b7acb0a4924a641e3ddc2242fda4075b2d7ed8a16')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D -m755 -D target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -D -m644 -D man/${pkgname}.1 "$pkgdir/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
