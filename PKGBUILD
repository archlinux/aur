# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=promrail
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="Git-native GitOps promotion tool"
arch=('x86_64')
url="https://github.com/forkline/prl"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/forkline/promrail/releases/download/v${pkgver}/prl-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('4f3d713ad98e12d1cef3b28adac8406a0e87be722afbd7ad56fec0985ce71563')

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
