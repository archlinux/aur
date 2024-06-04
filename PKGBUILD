# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=exchango-bin
pkgver=0.1.0
pkgrel=2
pkgdesc='Currency conversion tool written in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/exchango'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/exchango-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('32d2d3e94bfb4b904f9ddbe9e14be00c83b8b88de966f3741ed7f48d8bfde6d3')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/exchango-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('bf616d2d2ebe4f097159a5c6d036ce8bba1813bda4e0223a6787d8982e08482e')

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
