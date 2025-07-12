# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=5.0.5
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL3')
depends=('glibc')
provides=("$_pkg")
conflicts=("$_pkg")
options=(!strip)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-amd64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
sha256sums_i686=('f0242a0821f100e1db437d70e23e51a601ff958bc26bedf25e2c51db76a8dfcd')
sha256sums_x86_64=('6f52ae8b1140d3d072002108d4f6dbbcdb42717c1386cd5d99f8de201720770e')
sha256sums_armv6h=('52a1489554fbe17755225ccde5d6ca98d595462db0496f6ca1799d76ac13900d')
sha256sums_armv7h=('52a1489554fbe17755225ccde5d6ca98d595462db0496f6ca1799d76ac13900d')
sha256sums_aarch64=('beaf996fb90b4f82d2a574d9e09bd1a589ca8a9efe672cbfbced3148ed9a6d3b')

package () {
	install -Dv ticker -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./ticker completion bash > "${pkgdir}/usr/share/bash-completion/completions/ticker"

	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./ticker completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_ticker"

	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./ticker completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/ticker.fish"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
