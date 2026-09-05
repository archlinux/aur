# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgbase=genv-bin
pkgname=genv-bin
pkgver=4.3.1
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/genv'
license=('MIT')
provides=('genv')
conflicts=('genv')
source_x86_64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('882cd58d81336d5facc564260ae6df90f840655c3e87e80673ebedf606e9f721')
source_aarch64=("https://github.com/ks1686/genv/releases/download/v${pkgver}/genv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('6a24769d45dad9f2240d820395b905d629f457b1a2dbf8eed04986771f7b6405')

package() {
	install -Dm755 "./genv" "${pkgdir}/usr/bin/genv"
	install -Dm644 "completions/genv.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_genv"
	install -Dm644 "completions/genv.bash" "${pkgdir}/usr/share/bash-completion/completions/genv"
	install -Dm644 "completions/genv.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/genv.fish"
}
