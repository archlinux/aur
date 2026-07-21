# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c8e9b1f6b541190e3f62c89a6852713b2030ccc565a0c8532af4cbe567d45db1')
sha256sums_aarch64=('4e77a925858d7a44d97c187d90d36ebcc918da7e8adb4a686e2d3508c111ced2')

build() {
  ./nls --completion bash --completion zsh --completion fish
}

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/nls"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_nls"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/nls.fish"
}
