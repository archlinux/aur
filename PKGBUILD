# Maintainer: Wenxuan Zhang <wenxuangm@gmail.com>
pkgname=csview-bin
_binname=csview
pkgver=0.3.5
pkgrel=2
pkgdesc="A high performance csv viewer with cjk/emoji support"
arch=(i686 x86_64)
url="https://github.com/wfxr/csview"
license=("MIT" "APACHE")
depends=()
makedepends=("rust" "cargo")
conflicts=("csview" "csview-git")

source=("${_binname}-v${pkgver}.tar.gz::https://github.com/wfxr/csview/releases/download/v${pkgver}/${_binname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('c2cc034979579a68bdd62c2b7380b8f0')

package() {
	cd "${srcdir}/${_binname}-v${pkgver}-x86_64-unknown-linux-gnu"
	install -Dm755 "${_binname}"                       "$pkgdir/usr/bin/${_binname}"
	install -Dm644 "completions/fish/${_binname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_binname}.fish"
	install -Dm644 "completions/zsh/_${_binname}"      "$pkgdir/usr/share/zsh/site-functions/_${_binname}"
	install -Dm644 "README.md"                        "$pkgdir/usr/share/doc/${_binname}/README.md"
	install -Dm644 "LICENSE-MIT"                      "$pkgdir/usr/share/licenses/${_binname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                   "$pkgdir/usr/share/licenses/${_binname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
