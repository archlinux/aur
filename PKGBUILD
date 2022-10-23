# Maintainer: Hongqi Yu <bowser1704@gmail.com>
_pkgname=ticli
pkgname=ticli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A modern cli for tikv.'
arch=(i686 x86_64)
url='https://github.com/hackathon-2022-ticli/ticli'
license=("MIT" "APACHE")
makedepends=('rust' 'cargo')
conflicts=("ticli" "ticli-git")
provides=("ticli")

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('b02704f4bea2adce7f05c5b7fefd31ba')

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
