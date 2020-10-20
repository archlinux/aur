# Maintainer: Wenxuan Zhang <wenxuangm@gmail.com>
pkgname=csview-bin
binname=csview
pkgver=0.3.5
pkgrel=1
pkgdesc="A high performance csv viewer with cjk/emoji support"
arch=(i686 x86_64)
url="https://github.com/wfxr/csview"
license=("MIT" "APACHE")
depends=()
makedepends=("rust" "cargo")

source=("${binname}-v${pkgver}.tar.gz::https://github.com/wfxr/csview/releases/download/v${pkgver}/${binname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('c2cc034979579a68bdd62c2b7380b8f0')

package() {
	cd "${srcdir}/${binname}-v${pkgver}-x86_64-unknown-linux-gnu"
	install -Dm755 "${binname}"                       "$pkgdir/usr/bin/${binname}"
	install -Dm644 "completions/fish/${binname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${binname}.fish"
	install -Dm644 "completions/zsh/_${binname}"      "$pkgdir/usr/share/zsh/site-functions/_${binname}"
	install -Dm644 "README.md"                        "$pkgdir/usr/share/doc/${binname}/README.md"
	install -Dm644 "LICENSE-MIT"                      "$pkgdir/usr/share/licenses/${binname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                   "$pkgdir/usr/share/licenses/${binname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
