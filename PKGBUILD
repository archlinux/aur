# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=promrail
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="Git-native GitOps promotion tool"
arch=('x86_64')
url="https://github.com/forkline/prl"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/forkline/promrail/releases/download/v${pkgver}/prl-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('8bf9118927cbec9b64224b5aa470892b05b2cb6d4b787eb18aa31c070e88b792')

package() {
	install -Dm755 prl "${pkgdir}/usr/bin/prl"

	install -d "${pkgdir}/usr/share/bash-completion/completions"
	install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
	install -d "${pkgdir}/usr/share/zsh/site-functions"
	install -d "${pkgdir}/usr/share/elvish/lib"

	./prl completions bash > "${pkgdir}/usr/share/bash-completion/completions/prl"
	./prl completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/prl.fish"
	./prl completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_prl"
	./prl completions elvish > "${pkgdir}/usr/share/elvish/lib/prl.elv"
}
