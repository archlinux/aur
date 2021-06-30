# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=terpod-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A terminal podcast manager"
url="https://github.com/samhh/terpod/"
arch=("x86_64")
license=("AGPL")
source=("$url/releases/download/$pkgver/terpod-linux-amd64")
sha256sums=("c282eb671316c5c0c5c72245cd0959da8441f5078e16b85af15883ebfe9238a7")

package() {
	install -Dm755 "terpod-linux-amd64" "$pkgdir/usr/bin/terpod"
	_install_completion_script bash "bash-completion/completions/terpod"
	_install_completion_script zsh "zsh/site-functions/_terpod"
	_install_completion_script fish "fish/vendor_completions.d/terpod.fish"
}

_install_completion_script() {
	install -Dm644 <("$pkgdir/usr/bin/terpod" --$1-completion-script "/usr/bin/terpod") "$pkgdir/usr/share/$2"
}

