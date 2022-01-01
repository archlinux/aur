# Maintainer: Wenxuan Zhang <wenxuangm@gmail.com>
_pkgname=csview
pkgname=csview-bin
pkgver=0.3.11
pkgrel=1
pkgdesc='A high performance csv viewer with cjk/emoji support'
arch=(i686 x86_64)
url='https://github.com/wfxr/csview'
license=("MIT" "APACHE")
makedepends=('rust' 'cargo')
conflicts=("csview" "csview-git")
provides=("csview")

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('05121010a63a8558c35c301467ebe6a7')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu"
	install -Dm755 "${_pkgname}"                       "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "completions/fish/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm644 "completions/zsh/_${_pkgname}"      "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "README.md"                         "$pkgdir/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "LICENSE-MIT"                       "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE"                    "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
