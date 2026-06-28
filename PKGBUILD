# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2606.0
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
source=("gomuks-source::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_bin_base_source="${url}/releases/download/v${pkgver}/gomuks"
source_x86_64=("gomuks.bin-x86_64::$_bin_base_source-amd64")
source_aarch64=("gomuks.bin-aarch64::$_bin_base_source-arm64")
source_armv7h=("gomuks.bin-armv7h::$_bin_base_source-arm")

sha256sums=('b55ecc9bb050ad00553077e2f1e451a1ae56ee0f39240a359354ab29b390ff46')
sha256sums_x86_64=('cf6cf84b8532867d2b96ba75414215f11e536a9db8b66b120a3c008aae43298f')
sha256sums_aarch64=('40fe1900faf05de09c6d3676437712af96893a2860d32c4b4eb6c9f88793ff7c')
sha256sums_armv7h=('cb558d37fd90a6f28aff9ffcdcf76720d943ec5653407364da1d9a7f9080a760')


package() {
	cd "$srcdir"

	install -Dm755 "gomuks.bin-$CARCH" "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

