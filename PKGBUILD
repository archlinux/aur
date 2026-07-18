# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ddb6bde7c711a0cd6b950afa8a8636b2519c5b24439b9342bd38a19ead8fc4b7')
sha256sums_aarch64=('92b8aecb32871e2a878095c183222fc8294bc3aaf1c6903e0edb1c32b13d1e83')

build() {
  ./nls --completion bash --completion zsh --completion fish
}

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/nls"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_nls"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nls.fish"
}
