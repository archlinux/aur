# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=5.0.6
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL-3.0-only')
depends=('glibc')
provides=("$_pkg")
conflicts=("$_pkg")
options=(!strip)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
sha256sums_x86_64=('48c8ba4d8f08460f6249d4f949fdd39c2059defc7d66a65d2193402d1414b6f7')
sha256sums_armv6h=('dc47c0e4a7a7867070c93917bf2b624b5bb0317dea3eab1a42b67fe181009629')
sha256sums_armv7h=('dc47c0e4a7a7867070c93917bf2b624b5bb0317dea3eab1a42b67fe181009629')
sha256sums_aarch64=('6f932c9a5c40b831a2b15794489e50c434fd91f81596cfc82b007a06fe44f13d')

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
# vim:set noet sts=0 sw=4 ts=4:
