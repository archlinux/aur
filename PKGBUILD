# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=exchango-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='Currency conversion tool written in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/exchango'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/exchango-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('239951d0a151b4d793023990e9d88a3956bc706cb7c23584ad1209ed87dd35b9')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/exchango-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('510168f68dab9632297a28d1295b894236602fc035df192060977ba83de71929')

build() {
	./exchango completion bash >exchango.bash
	./exchango completion zsh >_exchango.zsh
	./exchango completion fish >exchango.fish
}

package() {
	install -Dm755 exchango "${pkgdir}/usr/bin/exchango"
	install -Dm644 exchango.bash "${pkgdir}/usr/share/bash-completion/completions/exchango"
	install -Dm644 _exchango.zsh "${pkgdir}/usr/share/zsh/site-functions/_exchango"
	install -Dm644 exchango.fish "${pkgdir}/usr/share/fish/vendor_completions.d/exchango.fish"
}
