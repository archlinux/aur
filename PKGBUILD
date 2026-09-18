# Maintainer: aurrrrrr <no email>

_pkgname=gomuks-web
pkgname=${_pkgname}-bin
pkgver=0.2609.0
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

sha256sums=('a761294c1c6d304d2e1fda229d941b98284724ffcee4c5e21e5ed9044f3c64af')
sha256sums_x86_64=('fb6ec03d9cb9f22a959c3ba6680d95d2e80197ae413168acb42f96a10d53bb7d')
sha256sums_aarch64=('00e47caede601f34a003fdf1ba70e270de5f41aff243c82a1790a3a841d8d5ce')
sha256sums_armv7h=('ad0e101797d79b8e9b62d981f7f1045ed883067d48dedaf37e9da357fd529854')


package() {
	cd "$srcdir"

	install -Dm755 "gomuks-${pkgver}.bin-$CARCH" "$pkgdir/usr/bin/${_pkgname}"

	cd "$srcdir/gomuks-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md CHANGELOG.md
	
}

