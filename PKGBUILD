# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2610.0
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

sha256sums=('246906bcdea41417e2c1ae42667f1bc8278623682b652512de59efd3773dfadf')
sha256sums_x86_64=('c07241cdf824eacf0ce6ac8a471795469bdf663e91a36145386908b64f90eb43')
sha256sums_aarch64=('6786b5d66fb537c1aa5b3c65327535607ff7f752843fccd026c695345428f66c')
sha256sums_armv7h=('e488b1b722a27c19d1c1be10bafd5b46511be5909cf3b38e8646c6340d45a343')


package() {
	cd "$srcdir"

	install -Dm755 "gomuks-${pkgver}.bin-$CARCH" "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

