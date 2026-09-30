# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgbase=genv-bin
pkgname=genv-bin
pkgver=4.5.3
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/genv'
license=('MIT')
provides=('genv')
conflicts=('genv')
source_x86_64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('8824d96ad6a9c20f71165ff21c0696691cb329cb492d29354dd74380fe283089')
source_aarch64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('afd4f7e22c043149441454f391f981007e8e1b90934437f21319d2c11540767b')

package() {
	install -Dm755 "./genv" "${pkgdir}/usr/bin/genv"
	install -Dm644 "completions/genv.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_genv"
	install -Dm644 "completions/genv.bash" "${pkgdir}/usr/share/bash-completion/completions/genv"
	install -Dm644 "completions/genv.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/genv.fish"
}
