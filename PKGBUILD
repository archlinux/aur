# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0d3b29e85f2e69dc10f6e52d20a02128c4a6711ddcfd300627a2aac720970798')
sha256sums_aarch64=('739cc21a4410348c37a4084c54f1254b1ba2886e73f5eac7dd98e892e9924349')

build() {
  ./nls --completion bash --completion zsh --completion fish
}

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/nls"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_nls"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nls.fish"
}
