# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgbase=genv-bin
pkgname=genv-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/genv'
license=('MIT')
provides=('genv')
conflicts=('genv')
source_x86_64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('6a527432d9521f81cefb82a82d801516a61eb6e079f358268850b807d94f8bb7')
source_aarch64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('1daa8f7295f8fb75363d88c035789bfcc458825988191b2d5d9e50f960e4e39c')

package() {
	install -Dm755 "./genv" "${pkgdir}/usr/bin/genv"
	install -Dm644 "completions/genv.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_genv"
	install -Dm644 "completions/genv.bash" "${pkgdir}/usr/share/bash-completion/completions/genv"
	install -Dm644 "completions/genv.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/genv.fish"
}
