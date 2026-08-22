# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2608.0
pkgrel=1
pkgdesc="A Matrix client written in Go using mautrix-go. Web Frontend."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/gomuks/gomuks"
license=('AGPL-3.0-only')
groups=()
depends=()
makedepends=() 
provides=("gomuks-web")
conflicts=("gomuks-web")
replaces=()
backup=()
options=(!debug)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

_bin_base_source="${url}/releases/download/v${pkgver}/gomuks"
source_x86_64=("gomuks-${pkgver}.bin-x86_64::$_bin_base_source-amd64")
source_aarch64=("gomuks-${pkgver}.bin-aarch64::$_bin_base_source-arm64")
source_armv7h=("gomuks-${pkgver}.bin-armv7h::$_bin_base_source-arm")

sha256sums=('fa9adfbf5da1dc5685a9adea3ed467844a719f477cda448bf747d2f88a733a89')
sha256sums_x86_64=('a196a13bee9c65a339480e509a51d971275335512747c3d543f6ddfea9ddd936')
sha256sums_aarch64=('f37f12bfd9f5ead21fc89d0c0f8903a4df58aff6122b2ead61faacfb79185e69')
sha256sums_armv7h=('c388e8b6c925f8f38518841f51d09f908e4bf864317baad4cdb8e5c5c8564a15')


package() {
	cd "$srcdir"

	install -Dm755 "gomuks-${pkgver}.bin-$CARCH" "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

