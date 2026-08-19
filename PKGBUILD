# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgbase=genv-bin
pkgname=genv-bin
pkgver=4.1.0
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/genv'
license=('MIT')
provides=('genv')
conflicts=('genv')
source_x86_64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('bdc0eee051fcfba084f9680e5edf939655fc6d72c6f6e7aad38045f228b81b87')
source_aarch64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('c8d04e9d9471705941598314684f3c5ee02ab0ae5383a3e4ec2631ee339d4d41')

package() {
	install -Dm755 "./genv" "${pkgdir}/usr/bin/genv"
	install -Dm644 "completions/genv.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_genv"
	install -Dm644 "completions/genv.bash" "${pkgdir}/usr/share/bash-completion/completions/genv"
	install -Dm644 "completions/genv.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/genv.fish"
}
