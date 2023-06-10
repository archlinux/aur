# Maintainer: Marco Radocchia <marco.radocchia@outlook.com>
_pkgname="schoenerd"
pkgname="${_pkgname}-bin"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Schoener's D index calculator for niche overlap."
arch=('x86_64')
url="https://github.com/marcoradocchia/schoenerd"
license=('GPL3')
provides=('schoenerd')
conflicts=('schoenerd')
source=("https://github.com/marcoradocchia/schoenerd/releases/download/v${pkgver}/schoenerd-${pkgver}-${CARCH}-linux-gnu.tar.gz")
sha256sums=('dfb29473dc7439a735684eccab4b7aaff4050282227bd9991fc38cf1c8113dfe')

prepare() {
	tar -xvf "${_pkgname}-${pkgver}-${CARCH}-linux-gnu.tar.gz"
}

package() {
	install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

	install -Dm644 completions/_"${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 completions/"${_pkgname}".bash "$pkgdir/usr/share/bash-completion/completions/${_pkgname}.bash"
	install -Dm644 completions/"${_pkgname}".fish "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

	install -Dm644 man/"${_pkgname}".1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
